import 'dart:io';

import 'package:flutter/material.dart';
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
      color: Colors.grey.shade100,
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.fromLTRB(20, 150, 20, 60),
                child: Image.asset("assets/inycom_icon.png")),
          ),
          SliverToBoxAdapter(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Gestor",
                              style: TextStyle(
                                  fontFamily: "SourceSansPro",
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600)),
                          const Text("Tareas",
                              style: TextStyle(
                                  fontFamily: "SourceSansPro",
                                  fontSize: 44,
                                  color: Colors.red)),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      height: 1.5,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: SearchTextField(
                        controller: TextEditingController(),
                        onChanged: () {},
                        suffixIcon: const Icon(Icons.person_2_outlined),
                        hintText: "Usuario",
                        // copyFocusedBorder: true,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SearchTextField(
                        controller: TextEditingController(),
                        onChanged: () {},
                        suffixIcon: const Icon(Icons.lock_outline),
                        hintText: "Contraseña",
                        // copyFocusedBorder: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 50, bottom: Platform.isIOS ? 30 : 15),
                      child: ButtonWidget(
                          // color: Colors.grey,
                          textButton: "Continuar",
                          disabled: false,
                          context: context,
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OrdenesTrabajoPage(),
                              ),
                              (route) => false,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     margin: const EdgeInsets.only(top: 10),
          //     child: SearchTextField(
          //       controller: TextEditingController(),
          //       onChanged: () {},
          //       suffixIcon: const Icon(Icons.lock_outline),
          //       hintText: "Contraseña",
          //       //copyFocusedBorder: true,
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   // hasScrollBody: false,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Container(
          //         margin: EdgeInsets.only(
          //             top: 50, bottom: Platform.isIOS ? 30 : 15),
          //         child: ButtonWidget(
          //             textButton: "Continuar",
          //             disabled: false,
          //             context: context,
          //             onPressed: () {
          //               Navigator.pushAndRemoveUntil(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => const OrdenesTrabajoPage(),
          //                 ),
          //                 (route) => false,
          //               );
          //             }),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
