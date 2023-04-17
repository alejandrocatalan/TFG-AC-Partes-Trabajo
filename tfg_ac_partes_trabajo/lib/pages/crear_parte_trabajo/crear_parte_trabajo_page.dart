import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_textfield.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

class CrearParteTrabajoPage extends StatefulWidget {
  static const routeName = '/crear-parte-trabajo';

  const CrearParteTrabajoPage({Key? key}) : super(key: key);

  @override
  State<CrearParteTrabajoPage> createState() => _CrearParteTrabajoPageState();
}

class _CrearParteTrabajoPageState extends State<CrearParteTrabajoPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: context.translate("create_work_part"),
      body: Container(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: CustomScrollView(
          clipBehavior: Clip.hardEdge,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomTextField(
                    hintText: context.translate("work_to_be_done"),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: context.translate("observations"),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: Platform.isIOS ? 30 : 15),
                    child: ButtonWidget(
                        textButton: context.translate("create_part"),
                        disabled: false,
                        context: context,
                        onPressed: () {}),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
