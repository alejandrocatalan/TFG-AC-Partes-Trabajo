import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final double height;
  final double? width;

  const SearchTextField(
      {Key? key,
      this.hintText = "",
      required this.controller,
      this.obscureText = false,
      this.height = 50,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        maxLines: null,
        expands: false,
        style: MyFontStyles(MyColorStyles.darkGreyColor)
            .getSourceSansPro16Regular(),
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              MyFontStyles(MyColorStyles.greyColor).getSourceSansPro16Regular(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColorStyles.greyColor80,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: MyColorStyles.redColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: MyColorStyles.whiteColor.withOpacity(0.9),
        ),
      ),
    );
  }
}
