import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/utils/app_localizations.dart';

extension AppLocalizationsa on BuildContext {
  String translate(String key) =>
      AppLocalizations.of(this).translate(key) ?? '';

  String get languageCode => AppLocalizations.of(this).locale.languageCode;
}
