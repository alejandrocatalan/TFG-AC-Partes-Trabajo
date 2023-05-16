import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/search_textfield.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_ordenes_trabajo/ordenes_trabajo_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [Colors.red, Colors.red.shade100, Colors.white],
      //   ),
      // ),
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.fromLTRB(0, 150, 0, 30),
                  child: SvgPicture.asset("assets/inycom_icon.svg")),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                child: SearchTextField(
                  controller: TextEditingController(),
                  onChanged: () {},
                  suffixIcon: const Icon(Icons.person_2_outlined),
                  hintText: "Usuario",
                  copyFocusedBorder: true,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: SearchTextField(
                  controller: TextEditingController(),
                  onChanged: () {},
                  suffixIcon: const Icon(Icons.lock_outline),
                  hintText: "Contraseña",
                  copyFocusedBorder: true,
                ),
              ),
            ),
            SliverToBoxAdapter(
              // hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 50, bottom: Platform.isIOS ? 30 : 15),
                    child: ButtonWidget(
                        textButton: "Continuar",
                        disabled: false,
                        context: context,
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrdenesTrabajoPage(),
                            ),
                            (route) => false,
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
