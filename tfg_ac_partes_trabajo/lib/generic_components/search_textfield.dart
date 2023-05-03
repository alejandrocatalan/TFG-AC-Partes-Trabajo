import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final double height;
  final double? width;
  final Function onChanged;
  final TextInputType keyboardType;

  const SearchTextField(
      {Key? key,
      this.hintText = "",
      required this.controller,
      this.obscureText = false,
      this.height = 50,
      this.width,
      required this.onChanged,
      this.keyboardType = TextInputType.number})
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
        cursorColor: MyColorStyles.redColor,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyFontStyles(MyColorStyles.greyColor)
                .getSourceSansPro16Regular(),
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
            fillColor: MyColorStyles.whiteColor,
            suffixIcon: const Icon(Icons.search),
            suffixIconColor: MyColorStyles.redColor),
        onChanged: (value) => onChanged(value),
      ),
    );
  }
}
