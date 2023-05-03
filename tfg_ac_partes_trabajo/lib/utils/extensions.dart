import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/utils/app_localizations.dart';

extension AppLocalizationsa on BuildContext {
  String translate(String key) =>
      AppLocalizations.of(this).translate(key) ?? '';

  String get languageCode => AppLocalizations.of(this).locale.languageCode;
}

extension DecodeString on String {
  String decodeUtf8() {
    final output = utf8.decode(latin1.encode(this), allowMalformed: true);
    return output;
  }

  String get toUtf8 => utf8.decode(latin1.encode(this), allowMalformed: true);
}
