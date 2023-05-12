import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/black_and_normal_text.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_textfield.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/secondary_button_widget.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/pages/parte_personas/parte_personas_page.dart';
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
      title: "Editar ${context.translate("part")} ${widget.parteTrabajo.id}",
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
                  normalText: DateFormat('dd-MM-yyyy - kk:mm')
                      .format(widget.parteTrabajo.fechaInicio),
                ),
                const SizedBox(height: 12),
                BlackAndNormalText(
                  blackText: "${context.translate("end_date")}: ",
                  normalText: DateFormat('dd-MM-yyyy - kk:mm')
                      .format(widget.parteTrabajo.fechaFin),
                ),
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
                  onChanged: (value) {},
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
                  hintText: widget.parteTrabajo.trabajoRealizado,
                  readOnly: false,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 24, right: 24),
          child: SecondaryButtonWidget(
              textButton: context.translate("personnel"),
              disabled: false,
              context: context,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PartePersonasPage(parteTrabajo: widget.parteTrabajo),
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
                    bottom: Platform.isIOS ? 30 : 15, left: 24, right: 24),
                child: ButtonWidget(
                    textButton: "Cerrar parte",
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
    );
  }
}
