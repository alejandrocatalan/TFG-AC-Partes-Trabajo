import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_partes_bloc/listado_partes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/black_and_normal_text.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_textfield.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/secondary_button_widget.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/pages/parte_personas/parte_personas_page.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

class CrearParteTrabajoPage extends StatelessWidget {
  const CrearParteTrabajoPage({Key? key, required this.ordenTrabajo})
      : super(key: key);

  final OrdenTrabajo ordenTrabajo;

  @override
  Widget build(BuildContext context) {
    ParteTrabajo parteTrabajo = ParteTrabajo(
        ordenTrabajoId: ordenTrabajo.id!,
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now(),
        observaciones: "",
        trabajoRealizado: "",
        identificadorDispositivo: "");

    final ListadoPartesBloc bloc = BlocProvider.of<ListadoPartesBloc>(context);
    bloc.add(ListadoPartesEvent.onCreateParte(parteTrabajo: parteTrabajo));
    // bloc.add(const ListadoPartesEvent.onCleanLastParteModified());

    return const CrearParteTrabajoView();
  }
}

class CrearParteTrabajoView extends StatefulWidget {
  const CrearParteTrabajoView({Key? key}) : super(key: key);

  @override
  State<CrearParteTrabajoView> createState() => _CrearParteTrabajoViewState();
}

class _CrearParteTrabajoViewState extends State<CrearParteTrabajoView> {
  /// Variables
  ParteTrabajo _parteTrabajo = ParteTrabajo.initial();
  // Controllers
  final TextEditingController _textEditingControllerObservaciones =
      TextEditingController();
  final TextEditingController _textEditingControllerTrabajoRealizado =
      TextEditingController();

  /// Functions
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListadoPartesBloc, ListadoPartesState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.lastParteCreated != current.lastParteCreated,
      listener: (context, state) {
        if (state.isLoading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }

        _parteTrabajo = state.lastParteCreated;
      },
      builder: (context, state) {
        return CustomScaffold(
          title: "${context.translate("create_part")} ${_parteTrabajo.id}",
          body: Container(
            color: Colors.white,
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      BlackAndNormalText(
                        blackText: "${context.translate("start_date")}: ",
                        normalText: DateFormat('dd-MM-yyyy - kk:mm')
                            .format(_parteTrabajo.fechaInicio),
                      ),
                      const SizedBox(height: 12),
                      BlackAndNormalText(
                        blackText: "${context.translate("end_date")}: ",
                        normalText: DateFormat('dd-MM-yyyy - kk:mm')
                            .format(_parteTrabajo.fechaFin),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${context.translate("observations")}:',
                        style: MyFontStyles(MyColorStyles.darkGreyColor)
                            .getSourceSansPro18SemiBold(),
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: _textEditingControllerObservaciones,
                        hintText: _parteTrabajo.observaciones,
                        readOnly: false,
                        onChanged: (String value) {
                          _parteTrabajo =
                              _parteTrabajo.copyWith(observaciones: value);

                          BlocProvider.of<ListadoPartesBloc>(context).add(
                              ListadoPartesEvent.onUpdateParte(
                                  parteTrabajo: _parteTrabajo));
                        },
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${context.translate("work_to_be_done")}:',
                        style: MyFontStyles(MyColorStyles.darkGreyColor)
                            .getSourceSansPro18SemiBold(),
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: _textEditingControllerTrabajoRealizado,
                        hintText: _parteTrabajo.trabajoRealizado,
                        readOnly: false,
                        onChanged: (String value) {
                          _parteTrabajo =
                              _parteTrabajo.copyWith(trabajoRealizado: value);

                          BlocProvider.of<ListadoPartesBloc>(context).add(
                              ListadoPartesEvent.onUpdateParte(
                                  parteTrabajo: _parteTrabajo));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Container(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 24, right: 24),
                child: SecondaryButtonWidget(
                    textButton: context.translate("personnel"),
                    disabled: false,
                    context: context,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PartePersonasPage(parteTrabajo: _parteTrabajo),
                        ),
                      );
                    }),
              )),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          bottom: Platform.isIOS ? 30 : 15,
                          left: 24,
                          right: 24),
                      child: ButtonWidget(
                          textButton: context.translate("create_part"),
                          disabled: false,
                          context: context,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    )
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
