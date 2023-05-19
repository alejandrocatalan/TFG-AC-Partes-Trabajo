import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

class ParteTrabajoCard extends StatelessWidget {
  const ParteTrabajoCard(
      {super.key, required this.parteTrabajo, required this.onTap});

  final ParteTrabajo parteTrabajo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${context.translate("part")} ${parteTrabajo.id}',
                  style: MyFontStyles(MyColorStyles.darkGreyColor)
                      .getSourceSansPro18Bold()),
              const SizedBox(height: 8),
              Text(
                  '${context.translate("start_date")}: ${DateFormat('dd/MM/yyyy - kk:mm').format(parteTrabajo.fechaInicio)}',
                  style: MyFontStyles(MyColorStyles.darkGreyColor)
                      .getSourceSansPro16Regular()),
              if (parteTrabajo.fechaFin != null &&
                  parteTrabajo.fechaFin!.toString().isNotEmpty) ...[
                Text(
                    '${context.translate("end_date")}: ${DateFormat('dd/MM/yyyy - kk:mm').format(parteTrabajo.fechaFin!)}',
                    style: MyFontStyles(MyColorStyles.darkGreyColor)
                        .getSourceSansPro16Regular()),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
