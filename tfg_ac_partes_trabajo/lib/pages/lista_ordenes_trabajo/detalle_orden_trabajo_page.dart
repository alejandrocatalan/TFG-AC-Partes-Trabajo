import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/black_and_normal_text.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_textfield.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/secondary_button_widget.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/pages/orden_maestros/orden_maquinas_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/orden_maestros/orden_materiales_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/orden_maestros/orden_personas_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_partes_trabajo/partes_trabajo_page.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

class DetallesOrdenTrabajoPage extends StatefulWidget {
  final OrdenTrabajo ordenTrabajo;

  const DetallesOrdenTrabajoPage({Key? key, required this.ordenTrabajo})
      : super(key: key);

  @override
  State<DetallesOrdenTrabajoPage> createState() =>
      _DetallesOrdenTrabajoPageState();
}

class _DetallesOrdenTrabajoPageState extends State<DetallesOrdenTrabajoPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "${context.translate("order")} ${widget.ordenTrabajo.id}",
      body: Container(
        color: Colors.grey.shade100,
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  BlackAndNormalText(
                      blackText: "${context.translate("start_date")}: ",
                      normalText: DateFormat('dd-MM-yyyy – kk:mm')
                          .format(widget.ordenTrabajo.fechaInicio)),
                  const SizedBox(height: 12),
                  BlackAndNormalText(
                    blackText: "${context.translate("end_date")}: ",
                    normalText: widget.ordenTrabajo.fechaFin != null
                        ? DateFormat('dd-MM-yyyy – kk:mm')
                            .format(widget.ordenTrabajo.fechaFin!)
                        : "",
                  ),
                  const SizedBox(height: 12),
                  BlackAndNormalText(
                      blackText: "${context.translate("type")}: ",
                      normalText: widget.ordenTrabajo.tipo ?? ""),
                  const SizedBox(height: 12),
                  BlackAndNormalText(
                      blackText: "${context.translate("installation")}: ",
                      normalText: widget.ordenTrabajo.instalacion ?? ""),
                  const SizedBox(height: 12),
                  BlackAndNormalText(
                      blackText:
                          "${context.translate("customer_order_code")}: ",
                      normalText: widget.ordenTrabajo.codigoOrdenCliente),
                  const SizedBox(height: 12),
                  Text(
                    '${context.translate("observations")}:',
                    style: MyFontStyles(MyColorStyles.darkGreyColor)
                        .getSourceSansPro18SemiBold(),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: TextEditingController(),
                    hintText: widget.ordenTrabajo.observaciones ?? "",
                    readOnly: true,
                    onChanged: () {},
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
                    hintText: widget.ordenTrabajo.trabajoARealizar ?? "",
                    readOnly: true,
                    onChanged: () {},
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
                          OrdenPersonasPage(ordenTrabajo: widget.ordenTrabajo),
                    ),
                  );
                }),
          )),
          SliverToBoxAdapter(
              child: Container(
            padding:
                const EdgeInsets.only(top: 0, bottom: 15, left: 24, right: 24),
            child: SecondaryButtonWidget(
                textButton: "Materiales",
                disabled: false,
                context: context,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrdenMaterialesPage(
                          ordenTrabajo: widget.ordenTrabajo),
                    ),
                  );
                }),
          )),
          SliverToBoxAdapter(
              child: Container(
            padding:
                const EdgeInsets.only(top: 0, bottom: 15, left: 24, right: 24),
            child: SecondaryButtonWidget(
                textButton: "Maquinaria",
                disabled: false,
                context: context,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OrdenMaquinasPage(ordenTrabajo: widget.ordenTrabajo),
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
                      textButton: context.translate("view_work_parts"),
                      disabled: false,
                      context: context,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          PartesTrabajoPage.routeName,
                          arguments: widget.ordenTrabajo,
                        );
                      }),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

/// Ejemplo de widgets con condición
// Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'ID: ${widget.ordenTrabajo.id}',
//                   style: MyFontStyles(MyColorStyles.darkGreyColor)
//                       .getSourceSansPro20SemiBold(),
//                 ),
//                 const SizedBox(height: 12),
//                 Text(
//                     '${context.translate("start_date")}: ${widget.ordenTrabajo.fechaInicio.toString()}',
//                     style: MyFontStyles(MyColorStyles.darkGreyColor)
//                         .getSourceSansPro18Regular()),
//                 if (widget.ordenTrabajo.fechaFin != null) ...[
//                   const SizedBox(height: 12),
//                   Text(
//                     '${context.translate("end_date")}: ${widget.ordenTrabajo.fechaFin!.toString()}',
//                     style: MyFontStyles(MyColorStyles.darkGreyColor)
//                         .getSourceSansPro18Regular(),
//                   ),
//                 ],
//                 if (widget.ordenTrabajo.tipo != null) ...[
//                   const SizedBox(height: 12),
//                   Text(
//                     '${context.translate("type")}: ${widget.ordenTrabajo.tipo!}',
//                     style: MyFontStyles(MyColorStyles.darkGreyColor)
//                         .getSourceSansPro18Regular(),
//                   ),
//                 ],
//                 if (widget.ordenTrabajo.observaciones != null) ...[
//                   const SizedBox(height: 12),
//                   Text(
//                     '${context.translate("observations")}: ${widget.ordenTrabajo.observaciones!}',
//                     style: MyFontStyles(MyColorStyles.darkGreyColor)
//                         .getSourceSansPro18Regular(),
//                   ),
//                 ],
//                 if (widget.ordenTrabajo.trabajoARealizar != null) ...[
//                   const SizedBox(height: 12),
//                   Text(
//                     '${context.translate("work_to_be_done")}: ${widget.ordenTrabajo.trabajoARealizar!}',
//                     style: MyFontStyles(MyColorStyles.darkGreyColor)
//                         .getSourceSansPro18Regular(),
//                   ),
//                 ],
//                 const SizedBox(height: 12),
//                 Text(
//                   '${context.translate("customer_order_code")}: ${widget.ordenTrabajo.codigoOrdenCliente}',
//                   style: const TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//                 if (widget.ordenTrabajo.instalacion != null) ...[
//                   const SizedBox(height: 12),
//                   Text(
//                     '${context.translate("installation")}: ${widget.ordenTrabajo.instalacion!}',
//                     style: MyFontStyles(MyColorStyles.darkGreyColor)
//                         .getSourceSansPro18Regular(),
//                   ),
//                 ],
//               ],
//             ),