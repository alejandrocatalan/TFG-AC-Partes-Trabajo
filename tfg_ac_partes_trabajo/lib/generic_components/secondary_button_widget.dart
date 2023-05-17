import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';

class SecondaryButtonWidget extends StatelessWidget {
  const SecondaryButtonWidget({
    Key? key,
    required this.textButton,
    required this.disabled,
    required this.context,
    required this.onPressed,
    this.color,
    this.unFocus = false,
    this.widthPercentage = 1.0,
  }) : super(key: key);

  final String textButton;
  final bool disabled;
  final BuildContext context;
  final Function onPressed;
  final Color? color;
  final double widthPercentage;

  // Dismis keyboard when press button
  final bool unFocus;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled
          ? null
          : () {
              if (unFocus) FocusScope.of(context).unfocus();
              onPressed.call();
            },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: MyColorStyles.redColor, width: 2),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(0),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(MediaQuery.of(context).size.width * widthPercentage, 50),
        ),
        backgroundColor: disabled
            ? MaterialStateProperty.all<Color>(const Color(0xFFBBBBBB))
            : MaterialStateProperty.all<Color>(
                color ?? MyColorStyles.whiteColor,
              ),
      ),
      child: Text(
        textAlign: TextAlign.center,
        style: disabled
            ? MyFontStyles(MyColorStyles.redColor).getSourceSansPro16SemiBold()
            : MyFontStyles(MyColorStyles.redColor).getSourceSansPro16SemiBold(),
        textButton,
      ),
    );
  }
}
