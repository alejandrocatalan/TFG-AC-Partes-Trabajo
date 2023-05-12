import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_partes_bloc/listado_partes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_textfield.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/search_textfield.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/secondary_button_widget.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/model/models/persona.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';
import 'package:tfg_ac_partes_trabajo/utils/utilities.dart';

class PartePersonasPage extends StatefulWidget {
  final ParteTrabajo parteTrabajo;

  const PartePersonasPage({Key? key, required this.parteTrabajo})
      : super(key: key);

  @override
  State<PartePersonasPage> createState() => _PartePersonasPageState();
}

class _PartePersonasPageState extends State<PartePersonasPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<ListadoPartesBloc>().add(
        ListadoPartesEvent.onLoadPersonasDeParte(
            parteTrabajoId: widget.parteTrabajo.id!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title:
            "${context.translate("personnel_in_part")} ${widget.parteTrabajo.id}",
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
              previous.listPartePersonas != current.listPartePersonas ||
              previous.listPersonas != current.listPersonas,
          builder: (context, state) {
            return Container(
              width: double.maxFinite,
              margin: const EdgeInsets.all(12),
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
                            ListadoPartesEvent.onSearchPersona(
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
                    child: ListViewPersonasDeParte(
                      personas: state.listPersonas,
                      partePersonas: state.listPartePersonas,
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

class ListViewPersonasDeParte extends StatefulWidget {
  final List<Persona> personas;
  final List<PartePersona> partePersonas;
  final ParteTrabajo parteTrabajo;

  const ListViewPersonasDeParte(
      {Key? key,
      required this.personas,
      required this.partePersonas,
      required this.parteTrabajo})
      : super(key: key);

  @override
  State<ListViewPersonasDeParte> createState() =>
      _ListViewPersonasDeParteState();
}

class _ListViewPersonasDeParteState extends State<ListViewPersonasDeParte> {
  late List<Map<String, String>> _dataList;
  final List<TextEditingController> _hoursControllers = [];
  final List<TextEditingController> _minsControllers = [];
  bool firstTime = true;
  bool secondTime = false;

  @override
  void initState() {
    super.initState();
  }

  void initialiseDataList() {
    // Se crea una lista combinando la descripción de Persona y las horas de PartePersona.
    // Se formatea las horas para pasar de double a String --> 2.5 == '2h 30m'
    _dataList = widget.partePersonas
        .map(
          (partePersona) => {
            'parteTrabajoId': partePersona.parteTrabajoId.toString(),
            'personaId': partePersona.personaId.toString(),
            'descripcion': widget.personas
                .firstWhere((p) => p.id == partePersona.personaId)
                .descripcion,
            'horas': partePersona.horas.toString(),
            //'horas': convertHours(partePersona.horas),
          },
        )
        .toList();
    // Se ordena la lista en orden decreciente según las horas
    _dataList.sort((a, b) => b['horas']!.compareTo(a['horas']!));

    // Se inicializan los controladores para los TextField de horas y para los de
    // minutos, según el número de elementos en la lista de datos.
    for (int i = 0; i < _dataList.length; i++) {
      _hoursControllers.add(TextEditingController());
      _minsControllers.add(TextEditingController());

      // bool buttonState = false;
      // if (context
      //     .read<ListadoPartesBloc>()
      //     .state
      //     .isButtonEnabledMap
      //     .containsKey(i)) {
      //   buttonState =
      //       context.read<ListadoPartesBloc>().state.isButtonEnabledMap[i]!;
      //   // debugPrint(buttonState.toString());
      // } else {
      //   context.read<ListadoPartesBloc>().add(
      //       ListadoPartesEvent.onChangeButtonMapState(
      //           buttonState: false, index: i));
      // }
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
                        _hoursControllers[i].clear();
                        _minsControllers[i].clear();
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
                        if (_hoursControllers[i].text.isNotEmpty ||
                            _minsControllers[i].text.isNotEmpty) {
                          context.read<ListadoPartesBloc>().add(
                              ListadoPartesEvent.onUpdateHoursPartePersona(
                                  parteTrabajoId: int.parse(
                                      _dataList[i]['parteTrabajoId']!),
                                  personaId:
                                      int.parse(_dataList[i]['personaId']!),
                                  hours: _hoursControllers[i].text.isNotEmpty
                                      ? _hoursControllers[i].text
                                      : null,
                                  mins: _minsControllers[i].text.isNotEmpty
                                      ? _minsControllers[i].text
                                      : null));

                          // _hoursControllers[i].clear();
                          // _minsControllers[i].clear();

                          // Verificar y limpiar los controladores solo si tienen un valor
                          if (_hoursControllers[i].text.isNotEmpty) {
                            _hoursControllers[i].clear();
                          }
                          if (_minsControllers[i].text.isNotEmpty) {
                            _minsControllers[i].clear();
                          }
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
              List<String> parts =
                  convertDoubleToHourString(double.parse(data['horas']!));
              String hours = parts[0];
              String minutes = parts[1];

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
                                controller: _hoursControllers[index],
                                hintText: hours,
                                textAlign: TextAlign.end,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.number,
                                height: 30,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 0),
                                onChanged: (String value) {
                                  if (_hoursControllers[index]
                                          .text
                                          .isNotEmpty ||
                                      _minsControllers[index].text.isNotEmpty) {
                                    // context.read<ListadoPartesBloc>().add(
                                    //     ListadoPartesEvent
                                    //         .onChangeButtonMapState(
                                    //             buttonState: true,
                                    //             index: index));
                                    context.read<ListadoPartesBloc>().add(
                                        const ListadoPartesEvent
                                                .onChangeButtonState(
                                            buttonState: true));
                                  } else {
                                    // context.read<ListadoPartesBloc>().add(
                                    //     ListadoPartesEvent
                                    //         .onChangeButtonMapState(
                                    //             buttonState: false,
                                    //             index: index));
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
                          const SizedBox(
                            width: 4,
                          ),
                          SizedBox(
                            width: 50,
                            child: CustomTextField(
                                controller: _minsControllers[index],
                                hintText: minutes,
                                textAlign: TextAlign.end,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  HourMinuteTextInputFormatter()
                                ],
                                height: 30,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 0),
                                onChanged: (String value) {
                                  if (_minsControllers[index].text.isNotEmpty ||
                                      _hoursControllers[index]
                                          .text
                                          .isNotEmpty) {
                                    // context.read<ListadoPartesBloc>().add(
                                    //     ListadoPartesEvent
                                    //         .onChangeButtonMapState(
                                    //             buttonState: true,
                                    //             index: index));
                                    context.read<ListadoPartesBloc>().add(
                                        const ListadoPartesEvent
                                                .onChangeButtonState(
                                            buttonState: true));
                                  } else {
                                    // context.read<ListadoPartesBloc>().add(
                                    //     ListadoPartesEvent
                                    //         .onChangeButtonMapState(
                                    //             buttonState: false,
                                    //             index: index));
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
                            "m",
                            style: MyFontStyles(MyColorStyles.darkGreyColor)
                                .getSourceSansPro16Regular(),
                          ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          // BlocBuilder<ListadoPartesBloc, ListadoPartesState>(
                          //   buildWhen: (previous, current) =>
                          //       previous.isButtonEnabledMap !=
                          //       current.isButtonEnabledMap,
                          //   builder: (context, state) {
                          //     if (context
                          //         .read<ListadoPartesBloc>()
                          //         .state
                          //         .isButtonEnabledMap
                          //         .containsKey(index)) {
                          //       return TinyButton(
                          //           disabled: !context
                          //               .read<ListadoPartesBloc>()
                          //               .state
                          //               .isButtonEnabledMap[index]!,
                          //           context: context,
                          //           onPressed: () {
                          //             bool buttonState = context
                          //                 .read<ListadoPartesBloc>()
                          //                 .state
                          //                 .isButtonEnabledMap[index]!;

                          //             context.read<ListadoPartesBloc>().add(
                          //                 ListadoPartesEvent.onChangeButtonMapState(
                          //                     buttonState: !buttonState,
                          //                     index: index));

                          //             context.read<ListadoPartesBloc>().add(
                          //                 ListadoPartesEvent
                          //                     .onUpdateHoursPartePersona(
                          //                         parteTrabajoId:
                          //                             int.parse(
                          //                                 data['parteTrabajoId']!),
                          //                         personaId:
                          //                             int.parse(data['personaId']!),
                          //                         hours:
                          //                             _hoursControllers[index].text,
                          //                         mins: _minsControllers[index]
                          //                             .text));
                          //           });
                          //     } else {
                          //       return Container();
                          //     }
                          //   },
                          // ),
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
