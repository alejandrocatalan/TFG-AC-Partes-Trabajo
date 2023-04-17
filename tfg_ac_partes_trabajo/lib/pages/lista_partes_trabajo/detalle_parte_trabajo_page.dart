import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

class DetallesParteTrabajo extends StatefulWidget {
  final ParteTrabajo parteTrabajo;

  const DetallesParteTrabajo({Key? key, required this.parteTrabajo})
      : super(key: key);

  @override
  State<DetallesParteTrabajo> createState() => _DetallesParteTrabajoState();
}

class _DetallesParteTrabajoState extends State<DetallesParteTrabajo> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: context.translate("work_part_detail"),
      body: Container(
        width: double.maxFinite,
        color: MyColorStyles.whiteColor,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${widget.parteTrabajo.id}'),
            Text(
                'Orden de trabajo: ${widget.parteTrabajo.ordenTrabajoId.toString()}'),
            Text(
                'Fecha de inicio: ${widget.parteTrabajo.fechaInicio.toString()}'),
            Text('Fecha de fin: ${widget.parteTrabajo.fechaFin.toString()}'),
            Text('Trabajo a realizar: ${widget.parteTrabajo.trabajoARealizar}'),
            Text('Observaciones: ${widget.parteTrabajo.observaciones}'),
          ],
        ),
      ),
    );
  }
}
