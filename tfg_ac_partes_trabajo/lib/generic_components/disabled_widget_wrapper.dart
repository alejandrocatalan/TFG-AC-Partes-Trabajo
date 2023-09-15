import 'package:flutter/material.dart';

class DisabledWidgetWrapper extends StatelessWidget {
  final Widget child;
  final bool? disabled;

  const DisabledWidgetWrapper({
    Key? key,
    required this.child,
    this.disabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (disabled ?? false) {
      return Opacity(
        opacity: 0.6,
        child: AbsorbPointer(
          absorbing: true,
          child: child,
        ),
      );
    } else {
      return child;
    }
  }
}
