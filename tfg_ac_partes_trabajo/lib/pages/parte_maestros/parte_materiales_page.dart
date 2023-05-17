import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_partes_bloc/listado_partes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_textfield.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/search_textfield.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/secondary_button_widget.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/material.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_maestro/parte_material.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';

class ParteMaterialesPage extends StatefulWidget {
  final ParteTrabajo parteTrabajo;

  const ParteMaterialesPage({Key? key, required this.parteTrabajo})
      : super(key: key);

  @override
  State<ParteMaterialesPage> createState() => _ParteMaterialesPageState();
}

class _ParteMaterialesPageState extends State<ParteMaterialesPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<ListadoPartesBloc>().add(
        ListadoPartesEvent.onLoadMaterialesDeParte(
            parteTrabajoId: widget.parteTrabajo.id!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: "Materiales en el parte ${widget.parteTrabajo.id}",
        body: BlocConsumer<ListadoPartesBloc, ListadoPartesState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          listener: (context, state) {
            if (state.isLoading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
            }
          },
          buildWhen: (previous, current) =>
              previous.listParteMateriales != current.listParteMateriales ||
              previous.listMateriales != current.listMateriales,
          builder: (context, state) {
            return Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(12),
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: SearchTextField(
                      controller: _searchController,
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.95,
                      keyboardType: TextInputType.text,
                      onChanged: (String value) {
                        context.read<ListadoPartesBloc>().add(
                            ListadoPartesEvent.onSearchMaterial(
                                parteTrabajoId: widget.parteTrabajo.id!,
                                search: value));
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 3,
                    color: MyColorStyles.redColor,
                    margin: const EdgeInsets.only(bottom: 8),
                  ),
                  Expanded(
                    child: ListViewMaterialesDeParte(
                      materiales: state.listMateriales,
                      parteMateriales: state.listParteMateriales,
                      parteTrabajo: widget.parteTrabajo,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class ListViewMaterialesDeParte extends StatefulWidget {
  final List<Materiall> materiales;
  final List<ParteMaterial> parteMateriales;
  final ParteTrabajo parteTrabajo;

  const ListViewMaterialesDeParte(
      {Key? key,
      required this.materiales,
      required this.parteMateriales,
      required this.parteTrabajo})
      : super(key: key);

  @override
  State<ListViewMaterialesDeParte> createState() =>
      _ListViewMaterialesDeParteState();
}

class _ListViewMaterialesDeParteState extends State<ListViewMaterialesDeParte> {
  late List<Map<String, String>> _dataList;
  final List<TextEditingController> _unitsControllers = [];

  @override
  void initState() {
    super.initState();
  }

  void initialiseDataList() {
    _dataList = widget.parteMateriales
        .map(
          (parteMaterial) => {
            'parteTrabajoId': parteMaterial.parteTrabajoId.toString(),
            'materialId': parteMaterial.materialId.toString(),
            'descripcion': widget.materiales
                .firstWhere((p) => p.id == parteMaterial.materialId)
                .descripcion,
            'unidades': parteMaterial.unidades.toString(),
          },
        )
        .toList();

    _dataList.sort((a, b) => b['unidades']!.compareTo(a['unidades']!));

    for (int i = 0; i < _dataList.length; i++) {
      _unitsControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    initialiseDataList();
    return Column(
      children: [
        BlocBuilder<ListadoPartesBloc, ListadoPartesState>(
          buildWhen: (previous, current) =>
              previous.isButtonEnabled != current.isButtonEnabled,
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryButtonWidget(
                    textButton: "Resetear",
                    widthPercentage: 0.45,
                    disabled: !context
                        .read<ListadoPartesBloc>()
                        .state
                        .isButtonEnabled,
                    context: context,
                    onPressed: () {
                      for (int i = 0; i < _dataList.length; i++) {
                        _unitsControllers[i].clear();
                      }
                      context.read<ListadoPartesBloc>().add(
                          const ListadoPartesEvent.onChangeButtonState(
                              buttonState: false));
                    }),
                ButtonWidget(
                    textButton: "Aplicar",
                    widthPercentage: 0.45,
                    disabled: !context
                        .read<ListadoPartesBloc>()
                        .state
                        .isButtonEnabled,
                    context: context,
                    onPressed: () {
                      for (int i = 0; i < _dataList.length; i++) {
                        if (_unitsControllers[i].text.isNotEmpty) {
                          context.read<ListadoPartesBloc>().add(
                                  ListadoPartesEvent
                                      .onUpdateUnidadesParteMaterial(
                                parteTrabajoId:
                                    int.parse(_dataList[i]['parteTrabajoId']!),
                                materialId:
                                    int.parse(_dataList[i]['materialId']!),
                                unidades: _unitsControllers[i].text.isNotEmpty
                                    ? _unitsControllers[i].text
                                    : "0.0",
                              ));

                          // Verificar y limpiar los controladores solo si tienen un valor
                          _unitsControllers[i].clear();
                        }
                      }
                      context.read<ListadoPartesBloc>().add(
                          const ListadoPartesEvent.onChangeButtonState(
                              buttonState: false));
                    }),
              ],
            );
          },
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _dataList.length,
            itemBuilder: (BuildContext context, int index) {
              final data = _dataList[index];
              String units = data['unidades']!;

              return Container(
                margin: const EdgeInsets.only(top: 7),
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border.fromBorderSide(BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: MyColorStyles.redColor,
                  )),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data['descripcion']!,
                        style: MyFontStyles(MyColorStyles.darkGreyColor)
                            .getSourceSansPro16Regular(),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 60,
                            child: CustomTextField(
                                controller: _unitsControllers[index],
                                hintText: units,
                                textAlign: TextAlign.end,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.number,
                                height: 30,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 0),
                                onChanged: (String value) {
                                  if (_unitsControllers[index]
                                      .text
                                      .isNotEmpty) {
                                    context.read<ListadoPartesBloc>().add(
                                        const ListadoPartesEvent
                                                .onChangeButtonState(
                                            buttonState: true));
                                  } else {
                                    context.read<ListadoPartesBloc>().add(
                                        const ListadoPartesEvent
                                                .onChangeButtonState(
                                            buttonState: false));
                                  }
                                }),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "h",
                            style: MyFontStyles(MyColorStyles.darkGreyColor)
                                .getSourceSansPro16Regular(),
                          ),
                        ],
                      ),
                    ]),
              );
            },
          ),
        ),
      ],
    );
  }
}
