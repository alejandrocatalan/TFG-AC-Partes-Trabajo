import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_partes_trabajo/partes_trabajo_page.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

class DetallesOrdenTrabajo extends StatefulWidget {
  final OrdenTrabajo ordenTrabajo;

  const DetallesOrdenTrabajo({Key? key, required this.ordenTrabajo})
      : super(key: key);

  @override
  State<DetallesOrdenTrabajo> createState() => _DetallesOrdenTrabajoState();
}

class _DetallesOrdenTrabajoState extends State<DetallesOrdenTrabajo> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: context.translate("work_order_detail"),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: double.maxFinite,
            color: MyColorStyles.whiteColor,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/inycom_icon.svg"),
                Text('ID: ${widget.ordenTrabajo.id}'),
                Text(
                    '${context.translate("start_date")}: ${widget.ordenTrabajo.fechaInicio.toString()}'),
                if (widget.ordenTrabajo.fechaFin != null)
                  Text(
                      '${context.translate("end_date")}: ${widget.ordenTrabajo.fechaFin!.toString()}'),
                if (widget.ordenTrabajo.tipo != null)
                  Text(
                      '${context.translate("type")}: ${widget.ordenTrabajo.tipo!}'),
                if (widget.ordenTrabajo.observaciones != null)
                  Text(
                      '${context.translate("observations")}: ${widget.ordenTrabajo.observaciones!}'),
                if (widget.ordenTrabajo.trabajoARealizar != null)
                  Text(
                      '${context.translate("work_to_be_done")}: ${widget.ordenTrabajo.trabajoARealizar!}'),
                Text(
                    '${context.translate("customer_order_code")}: ${widget.ordenTrabajo.codigoOrdenCliente}'),
                if (widget.ordenTrabajo.instalacion != null)
                  Text(
                      '${context.translate("installation")}: ${widget.ordenTrabajo.instalacion!}'),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(
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
    );
  }
}
