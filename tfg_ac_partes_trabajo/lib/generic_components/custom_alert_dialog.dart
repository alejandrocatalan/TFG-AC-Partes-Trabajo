import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/secondary_button_widget.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.context,
    this.icon,
    this.iconMargin,
    this.iconBackgroundColor,
    required this.titleText,
    required this.text,
    required this.mainButtonText,
    required this.pressMainButtonFunction,
    this.secondaryButtonText,
    this.onPressedSecudary,
  });

  final BuildContext context;
  final Widget? icon;
  final EdgeInsets? iconMargin;
  final Color? iconBackgroundColor;
  final String titleText;
  final String text;
  final String mainButtonText;
  final Function pressMainButtonFunction;
  final String? secondaryButtonText;
  final void Function()? onPressedSecudary;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 5,
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(24.5, 36, 24.5, 36),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Visibility(
                visible: icon != null,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: iconBackgroundColor ?? Colors.grey.shade200,
                  child: icon,
                ),
              ),
              Container(
                margin: icon == null
                    ? const EdgeInsets.only(top: 0)
                    : iconMargin ?? const EdgeInsets.only(top: 24),
                child: Text(
                  textAlign: TextAlign.center,
                  style: MyFontStyles(MyColorStyles.darkGreyColor)
                      .getSourceSansPro18SemiBold(),
                  titleText,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  style: MyFontStyles(MyColorStyles.darkGreyColor)
                      .getSourceSansPro14Regular(),
                  text,
                ),
              ),
              Visibility(
                child: Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: ButtonWidget(
                    textButton: mainButtonText,
                    disabled: false,
                    onPressed: pressMainButtonFunction,
                    context: context,
                  ),
                ),
              ),
              Visibility(
                visible: secondaryButtonText == null ? false : true,
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: SecondaryButtonWidget(
                    textButton:
                        secondaryButtonText == null ? '' : secondaryButtonText!,
                    disabled: false,
                    onPressed: () {
                      onPressedSecudary?.call();
                    },
                    context: context,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
