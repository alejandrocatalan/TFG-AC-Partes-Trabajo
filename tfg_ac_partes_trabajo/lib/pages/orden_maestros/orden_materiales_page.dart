import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_ordenes_bloc/listado_ordenes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/material.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_material.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';
import 'package:tfg_ac_partes_trabajo/utils/utilities.dart';

class OrdenMaterialesPage extends StatefulWidget {
  final OrdenTrabajo ordenTrabajo;

  const OrdenMaterialesPage({Key? key, required this.ordenTrabajo})
      : super(key: key);

  @override
  State<OrdenMaterialesPage> createState() => _OrdenMaterialesPageState();
}

class _OrdenMaterialesPageState extends State<OrdenMaterialesPage> {
  @override
  void initState() {
    context.read<ListadoOrdenesBloc>().add(
        ListadoOrdenesEvent.onLoadMaterialesDeOrden(
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
              previous.listMateriales != current.listMateriales,
          listener: (context, state) {
            if (state.isLoading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
            }
          },
          buildWhen: (previous, current) =>
              previous.listMateriales != current.listMateriales,
          builder: (context, state) {
            return Container(
              //color: Colors.white,
              width: double.maxFinite,
              margin: const EdgeInsets.all(12),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: DataTableMaterialesDeOrden(
                      materiales: state.listMateriales,
                      ordenMateriales: state.listOrdenMateriales,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class DataTableMaterialesDeOrden extends StatelessWidget {
  final List<Materiall> materiales;
  final List<OrdenMaterial> ordenMateriales;

  const DataTableMaterialesDeOrden({
    Key? key,
    required this.materiales,
    required this.ordenMateriales,
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
            "Unidades",
            style: MyFontStyles(MyColorStyles.darkGreyColor)
                .getSourceSansPro18SemiBold(),
            textAlign: TextAlign.center,
          ),
        )),
      ],
      rows: ordenMateriales
          .map(
            (orden) => DataRow(
              cells: [
                DataCell(
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      materiales
                          .firstWhere((p) => p.id == orden.materialId)
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
                      convertHours(orden.unidades),
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
