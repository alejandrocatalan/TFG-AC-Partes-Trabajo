import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final double height;
  final bool readOnly;
  final Function onChanged;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final EdgeInsets contentPadding;

  const CustomTextField({
    Key? key,
    this.hintText = "",
    required this.controller,
    this.obscureText = false,
    this.height = 150,
    this.readOnly = false,
    required this.onChanged,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.top,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        maxLines: null,
        expands: true,
        style: MyFontStyles(MyColorStyles.darkGreyColor)
            .getSourceSansPro16Regular(),
        textAlign: textAlign,
        textAlignVertical: textAlignVertical,
        readOnly: readOnly,
        cursorColor: MyColorStyles.redColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              MyFontStyles(MyColorStyles.greyColor).getSourceSansPro16Regular(),
          contentPadding: contentPadding,
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
          fillColor: MyColorStyles.whiteColor,
        ),
        onChanged: (value) => onChanged(value),
      ),
    );
  }
}
