import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';

class BlackAndNormalText extends StatelessWidget {
  final String blackText;
  final String normalText;
  final TextStyle? blackStyle;
  final TextStyle? normalStyle;

  const BlackAndNormalText(
      {super.key,
      required this.blackText,
      required this.normalText,
      this.blackStyle,
      this.normalStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(blackText,
            style: blackStyle ??
                MyFontStyles(MyColorStyles.darkGreyColor)
                    .getSourceSansPro18SemiBold()),
        Text(
          normalText,
          style: normalStyle ??
              MyFontStyles(MyColorStyles.darkGreyColor)
                  .getSourceSansPro18Regular(),
        ),
      ],
    );
  }
}
