import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_ordenes_bloc/listado_ordenes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/maquina.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_maquina.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';
import 'package:tfg_ac_partes_trabajo/utils/utilities.dart';

class OrdenMaquinasPage extends StatefulWidget {
  final OrdenTrabajo ordenTrabajo;

  const OrdenMaquinasPage({Key? key, required this.ordenTrabajo})
      : super(key: key);

  @override
  State<OrdenMaquinasPage> createState() => _OrdenMaquinasPageState();
}

class _OrdenMaquinasPageState extends State<OrdenMaquinasPage> {
  @override
  void initState() {
    context.read<ListadoOrdenesBloc>().add(
        ListadoOrdenesEvent.onLoadMaquinasDeOrden(
            ordenTrabajoId: widget.ordenTrabajo.id!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title:
            "${context.translate("machines_in_order")} ${widget.ordenTrabajo.id}",
        body: BlocConsumer<ListadoOrdenesBloc, ListadoOrdenesState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading ||
              previous.listMaquinas != current.listMaquinas,
          listener: (context, state) {
            if (state.isLoading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
            }
          },
          buildWhen: (previous, current) =>
              previous.listMaquinas != current.listMaquinas,
          builder: (context, state) {
            return Container(
              color: Colors.grey.shade100,
              width: double.maxFinite,
              padding: const EdgeInsets.all(12),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: DataTableMaquinasDeOrden(
                      maquinas: state.listMaquinas,
                      ordenMaquinas: state.listOrdenMaquinas,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class DataTableMaquinasDeOrden extends StatelessWidget {
  final List<Maquina> maquinas;
  final List<OrdenMaquina> ordenMaquinas;

  const DataTableMaquinasDeOrden({
    Key? key,
    required this.maquinas,
    required this.ordenMaquinas,
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
      rows: ordenMaquinas
          .map(
            (orden) => DataRow(
              cells: [
                DataCell(
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      maquinas
                          .firstWhere((p) => p.id == orden.maquinaId)
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
