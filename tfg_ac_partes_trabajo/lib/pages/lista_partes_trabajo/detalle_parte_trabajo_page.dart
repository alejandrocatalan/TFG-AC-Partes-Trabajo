import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/black_and_normal_text.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_textfield.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

class DetallesParteTrabajoPage extends StatefulWidget {
  final ParteTrabajo parteTrabajo;

  const DetallesParteTrabajoPage({Key? key, required this.parteTrabajo})
      : super(key: key);

  @override
  State<DetallesParteTrabajoPage> createState() =>
      _DetallesParteTrabajoPageState();
}

class _DetallesParteTrabajoPageState extends State<DetallesParteTrabajoPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "${context.translate("part")} ${widget.parteTrabajo.id}",
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                BlackAndNormalText(
                    blackText: "${context.translate("start_date")}: ",
                    normalText: widget.parteTrabajo.fechaInicio.toString()),
                const SizedBox(height: 12),
                BlackAndNormalText(
                    blackText: "${context.translate("end_date")}: ",
                    normalText: widget.parteTrabajo.fechaFin.toString()),
                const SizedBox(height: 12),
                Text(
                  '${context.translate("observations")}:',
                  style: MyFontStyles(MyColorStyles.darkGreyColor)
                      .getSourceSansPro18SemiBold(),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: widget.parteTrabajo.observaciones,
                  readOnly: false,
                ),
                const SizedBox(height: 12),
                Text(
                  '${context.translate("work_to_be_done")}:',
                  style: MyFontStyles(MyColorStyles.darkGreyColor)
                      .getSourceSansPro18SemiBold(),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: widget.parteTrabajo.trabajoARealizar,
                  readOnly: false,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
