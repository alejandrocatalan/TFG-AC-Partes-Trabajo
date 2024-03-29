import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_partes_bloc/listado_partes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/black_and_normal_text.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_alert_dialog.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_textfield.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/secondary_button_widget.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/pages/parte_maestros/parte_maquinas_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/parte_maestros/parte_materiales_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/parte_maestros/parte_personas_page.dart';
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
  /// Variables
  late ParteTrabajo _parteTrabajo;

  /// Functions
  @override
  void initState() {
    _parteTrabajo = widget.parteTrabajo;

    super.initState();
  }

  void showDialogCerrarParte(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          context: context,
          titleText: context.translate("attention"),
          text: context.translate("work_part_closed_successfully"),
          mainButtonText: context.translate("accept"),
          pressMainButtonFunction: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ListadoPartesBloc, ListadoPartesState>(
      listenWhen: (previous, current) =>
          previous.isParteClosed != current.isParteClosed,
      listener: (context, state) {
        if (state.isParteClosed) {
          showDialogCerrarParte(context);
        }
      },
      child: CustomScaffold(
        title:
            "${context.translate("edit")} ${context.translate("part")} ${widget.parteTrabajo.id}",
        body: Container(
          color: Colors.grey.shade100,
          padding: const EdgeInsets.all(12),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  BlackAndNormalText(
                    blackText: "${context.translate("start_date")}: ",
                    normalText: DateFormat('dd/MM/yyyy - kk:mm')
                        .format(widget.parteTrabajo.fechaInicio),
                  ),
                  if (widget.parteTrabajo.fechaFin != null &&
                      widget.parteTrabajo.fechaFin!.toString().isNotEmpty) ...[
                    const SizedBox(height: 12),
                    BlackAndNormalText(
                      blackText: "${context.translate("end_date")}: ",
                      normalText: DateFormat('dd/MM/yyyy - kk:mm')
                          .format(widget.parteTrabajo.fechaFin!),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Text(
                    '${context.translate("observations")}:',
                    style: MyFontStyles(MyColorStyles.darkGreyColor)
                        .getSourceSansPro18SemiBold(),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: TextEditingController(
                        text: widget.parteTrabajo.observaciones),
                    readOnly: false,
                    onChanged: (value) {
                      _parteTrabajo =
                          _parteTrabajo.copyWith(observaciones: value);
                      BlocProvider.of<ListadoPartesBloc>(context).add(
                          ListadoPartesEvent.onUpdateParte(
                              parteTrabajo: _parteTrabajo));
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "${context.translate("work_completed")}:",
                    style: MyFontStyles(MyColorStyles.darkGreyColor)
                        .getSourceSansPro18SemiBold(),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: TextEditingController(
                        text: widget.parteTrabajo.trabajoRealizado),
                    readOnly: false,
                    onChanged: (value) {
                      _parteTrabajo =
                          _parteTrabajo.copyWith(trabajoRealizado: value);
                      BlocProvider.of<ListadoPartesBloc>(context).add(
                          ListadoPartesEvent.onUpdateParte(
                              parteTrabajo: _parteTrabajo));
                    },
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 12, right: 12),
              child: SecondaryButtonWidget(
                  textButton: context.translate("personnel"),
                  disabled: false,
                  context: context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PartePersonasPage(
                            parteTrabajo: widget.parteTrabajo),
                      ),
                    );
                  }),
            )),
            SliverToBoxAdapter(
                child: Container(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 15, left: 12, right: 12),
              child: SecondaryButtonWidget(
                  textButton: context.translate("materials"),
                  disabled: false,
                  context: context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ParteMaterialesPage(
                            parteTrabajo: widget.parteTrabajo),
                      ),
                    );
                  }),
            )),
            SliverToBoxAdapter(
                child: Container(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 15, left: 12, right: 12),
              child: SecondaryButtonWidget(
                  textButton: context.translate("machinery"),
                  disabled: false,
                  context: context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ParteMaquinasPage(
                            parteTrabajo: widget.parteTrabajo),
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
                        bottom: Platform.isIOS ? 30 : 15, left: 12, right: 12),
                    child: ButtonWidget(
                        textButton: context.translate("close_work_part"),
                        disabled: false,
                        context: context,
                        onPressed: () {
                          context.read<ListadoPartesBloc>().add(
                              ListadoPartesEvent.onUpdateParte(
                                  parteTrabajo: _parteTrabajo.copyWith(
                                      fechaFin: DateTime.now())));
                        }),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
