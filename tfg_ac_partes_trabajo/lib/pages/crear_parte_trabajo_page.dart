import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';

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
      title: 'Crear parte de trabajo',
      body: Container(
        padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: const [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Trabajo a realizar',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Observaciones',
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: Platform.isIOS ? 30 : 15),
                    child: ButtonWidget(
                        textButton: 'Crear parte',
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
