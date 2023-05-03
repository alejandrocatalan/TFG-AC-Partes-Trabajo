import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_partes_bloc/listado_partes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_textfield.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/search_textfield.dart';
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
              previous.isLoading != current.isLoading ||
              previous.listPartePersonas != current.listPartePersonas,
          listener: (context, state) {
            if (state.isLoading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
            }
          },
          buildWhen: (previous, current) =>
              previous.listPartePersonas != current.listPartePersonas,
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
                  Expanded(
                    child: ListViewPersonasDeParte(
                      personas: state.listPersonas,
                      partePersonas: state.listPartePersonas,
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

  const ListViewPersonasDeParte({
    Key? key,
    required this.personas,
    required this.partePersonas,
  }) : super(key: key);

  @override
  State<ListViewPersonasDeParte> createState() =>
      _ListViewPersonasDeParteState();
}

class _ListViewPersonasDeParteState extends State<ListViewPersonasDeParte> {
  List<Map<String, String>> _dataList = [];
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _minsController = TextEditingController();
  // TextExpandedDropdownItem<String>? _valueDropdown1;
  // List<String> _horas = [];

  @override
  void initState() {
    _dataList = widget.partePersonas
        .map(
          (partePersona) => {
            'descripcion': widget.personas
                .firstWhere((p) => p.id == partePersona.personaId)
                .descripcion,
            'horas': convertHours(partePersona.horas)
          },
        )
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(width: 0.5, color: MyColorStyles.redColor),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _dataList.length,
        itemBuilder: (BuildContext context, int index) {
          final data = _dataList[index];
          List<String> parts = splitHoursAndMinutes(data['horas']!);
          String hours = parts[0];
          String minutes = parts[1];
          _hoursController.text = hours;
          _minsController.text = minutes;
          // _hoursController.text = data['horas']!;
          // _minsController.text = data['horas']!;

          return Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border.fromBorderSide(BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: MyColorStyles.redColor,
              )),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
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
                            controller: _hoursController,
                            textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.center,
                            height: 30,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 0),
                            onChanged: (String value) {}),
                      ),
                      SizedBox(
                        width: 50,
                        child: CustomTextField(
                            controller: _minsController,
                            textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.center,
                            height: 30,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 0),
                            onChanged: (String value) {}),
                      ),
                    ],
                  ),
                ]),
          );
        },
      ),
    );
  }
}

// ExpandedDropdown<String>(
//   key: const ValueKey("horas-dropdown"),
//   title: "Horas",
//   value: _valueDropdown1,
//   onChange: (index) {
//     _valueDropdown1 = TextExpandedDropdownItem<String>(
//       value: _horas[index],
//       text: _horas[index],
//     );
//   },
//   padding: EdgeInsets.zero,
//   items: _horas
//       .map(
//         (element) => TextExpandedDropdownItem<String>(
//           value: element,
//           text: element,
//         ),
//       )
//       .toList(),
// ),

// class DataTablePersonasDeParte extends StatelessWidget {
//   final List<Persona> personas;
//   final List<PartePersona> partePersonas;

//   const DataTablePersonasDeParte({
//     Key? key,
//     required this.personas,
//     required this.partePersonas,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DataTable(
//       headingRowColor:
//           MaterialStateColor.resolveWith((states) => Colors.red.shade100),
//       dataRowColor:
//           MaterialStateColor.resolveWith((states) => MyColorStyles.whiteColor),
//       border: TableBorder.symmetric(
//         inside: const BorderSide(width: 0.5, color: MyColorStyles.redColor),
//         outside: const BorderSide(width: 3, color: MyColorStyles.redColor),
//       ),
//       columns: [
//         DataColumn(
//             label: Expanded(
//           child: Text(
//             context.translate("description"),
//             style: MyFontStyles(MyColorStyles.darkGreyColor)
//                 .getSourceSansPro18SemiBold(),
//             textAlign: TextAlign.center,
//           ),
//         )),
//         DataColumn(
//             label: Expanded(
//           child: Text(
//             context.translate("hours"),
//             style: MyFontStyles(MyColorStyles.darkGreyColor)
//                 .getSourceSansPro18SemiBold(),
//             textAlign: TextAlign.center,
//           ),
//         )),
//       ],
//       rows: partePersonas
//           .map(
//             (partePersona) => DataRow(
//               cells: [
//                 DataCell(
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       personas
//                           .firstWhere((p) => p.id == partePersona.personaId)
//                           .descripcion,
//                       style: MyFontStyles(MyColorStyles.darkGreyColor)
//                           .getSourceSansPro16Regular(),
//                     ),
//                   ),
//                 ),
//                 DataCell(
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       convertHours(partePersona.horas),
//                       style: MyFontStyles(MyColorStyles.darkGreyColor)
//                           .getSourceSansPro16Regular(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//           .toList(),
//     );
//   }
// }
