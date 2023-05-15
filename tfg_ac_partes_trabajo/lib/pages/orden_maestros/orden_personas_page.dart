import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_ordenes_bloc/listado_ordenes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';
import 'package:tfg_ac_partes_trabajo/utils/utilities.dart';

class OrdenPersonasPage extends StatefulWidget {
  final OrdenTrabajo ordenTrabajo;

  const OrdenPersonasPage({Key? key, required this.ordenTrabajo})
      : super(key: key);

  @override
  State<OrdenPersonasPage> createState() => _OrdenPersonasPageState();
}

class _OrdenPersonasPageState extends State<OrdenPersonasPage> {
  @override
  void initState() {
    context.read<ListadoOrdenesBloc>().add(
        ListadoOrdenesEvent.onLoadPersonasDeOrden(
            ordenTrabajoId: widget.ordenTrabajo.id!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title:
            "${context.translate("personnel_in_order")} ${widget.ordenTrabajo.id}",
        body: BlocConsumer<ListadoOrdenesBloc, ListadoOrdenesState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading ||
              previous.listPersonas != current.listPersonas,
          listener: (context, state) {
            if (state.isLoading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
            }
          },
          buildWhen: (previous, current) =>
              previous.listPersonas != current.listPersonas,
          builder: (context, state) {
            return Container(
              //color: Colors.white,
              width: double.maxFinite,
              margin: const EdgeInsets.all(12),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: DataTablePersonasDeOrden(
                      personas: state.listPersonas,
                      ordenPersonas: state.listOrdenPersonas,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class DataTablePersonasDeOrden extends StatelessWidget {
  final List<Persona> personas;
  final List<OrdenPersona> ordenPersonas;

  const DataTablePersonasDeOrden({
    Key? key,
    required this.personas,
    required this.ordenPersonas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor:
          MaterialStateColor.resolveWith((states) => Colors.red.shade100),
      dataRowColor:
          MaterialStateColor.resolveWith((states) => MyColorStyles.whiteColor),
      border: TableBorder.symmetric(
        inside: const BorderSide(width: 0.5, color: MyColorStyles.redColor),
        outside: const BorderSide(width: 3, color: MyColorStyles.redColor),
      ),
      columns: [
        DataColumn(
            label: Expanded(
          child: Text(
            context.translate("description"),
            style: MyFontStyles(MyColorStyles.darkGreyColor)
                .getSourceSansPro18SemiBold(),
            textAlign: TextAlign.center,
          ),
        )),
        DataColumn(
            label: Expanded(
          child: Text(
            context.translate("hours"),
            style: MyFontStyles(MyColorStyles.darkGreyColor)
                .getSourceSansPro18SemiBold(),
            textAlign: TextAlign.center,
          ),
        )),
      ],
      rows: ordenPersonas
          .map(
            (orden) => DataRow(
              cells: [
                DataCell(
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      personas
                          .firstWhere((p) => p.id == orden.personaId)
                          .descripcion,
                      style: MyFontStyles(MyColorStyles.darkGreyColor)
                          .getSourceSansPro16Regular(),
                    ),
                  ),
                ),
                DataCell(
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      // orden.horas.toString(),
                      convertHours(orden.horas),
                      style: MyFontStyles(MyColorStyles.darkGreyColor)
                          .getSourceSansPro16Regular(),
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
