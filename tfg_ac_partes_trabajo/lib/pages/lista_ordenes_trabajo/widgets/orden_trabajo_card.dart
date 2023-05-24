import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

class OrdenTrabajoCard extends StatelessWidget {
  const OrdenTrabajoCard(
      {super.key, required this.ordenTrabajo, required this.onTap});

  final OrdenTrabajo ordenTrabajo;
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
              Text('${context.translate("order")} ${ordenTrabajo.id}',
                  style: MyFontStyles(MyColorStyles.darkGreyColor)
                      .getSourceSansPro18Bold()),
              const SizedBox(height: 8),
              Text(
                  '${context.translate("start_date")}: ${DateFormat('dd/MM/yyyy - kk:mm').format(ordenTrabajo.fechaInicio)}',
                  style: MyFontStyles(MyColorStyles.darkGreyColor)
                      .getSourceSansPro16Regular()),
              const SizedBox(height: 8),
              Text('${ordenTrabajo.trabajoARealizar}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFontStyles(MyColorStyles.darkGreyColor)
                      .getSourceSansPro16Regular()),
            ],
          ),
        ),
      ),
    );
  }
}
