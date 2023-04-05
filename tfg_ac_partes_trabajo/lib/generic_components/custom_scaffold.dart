import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const CustomScaffold({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: MyFontStyles(MyColorStyles.whiteColor)
              .getSourceSansPro20SemiBold(),
        ),
        backgroundColor: MyColorStyles.redColor,
      ),
      body: Container(
        child: body,
      ),
    );
  }
}
