import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';

class TinyButton extends StatelessWidget {
  const TinyButton({
    Key? key,
    this.icon = Icons.check,
    required this.disabled,
    required this.context,
    required this.onPressed,
    this.color,
    this.unFocus = false,
  }) : super(key: key);

  final IconData icon;
  final bool disabled;
  final BuildContext context;
  final Function onPressed;
  final Color? color;

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
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(10, 40),
          ),
          backgroundColor: disabled
              ? MaterialStateProperty.all<Color>(const Color(0xFFBBBBBB))
              : MaterialStateProperty.all<Color>(
                  color ?? MyColorStyles.redColor,
                ),
        ),
        child: Icon(
          icon,
        ));
  }
}
