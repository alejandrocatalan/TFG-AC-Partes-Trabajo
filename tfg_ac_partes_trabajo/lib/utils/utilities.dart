// class NumericTextInputFormatter {
//   static final _instance = NumericTextInputFormatter._();

//   factory NumericTextInputFormatter() => _instance;

//   NumericTextInputFormatter._();

//   TextInputFormatter get formatter {
//     return FilteringTextInputFormatter.digitsOnly;
//   }
// }

// String convertHours(double hours) {
//   int wholeHours = hours.floor();
//   int minutes = ((hours - wholeHours) * 60).round();
//   String result = '';
//   if (wholeHours > 0) {
//     result += '${wholeHours}h ';
//   }
//   result += '${minutes}m';
//   return result;
// }

import 'package:flutter/services.dart';

String convertHours(double hours) {
  int wholeHours = hours.floor();
  int minutes = ((hours - wholeHours) * 60).round();
  String result = '';
  if (wholeHours > 0) {
    result += '${wholeHours}h ';
  } else if (wholeHours == 0) {
    result += '${0}h ';
  }
  if (minutes > 0) {
    result += '${minutes}m';
  } else if (minutes == 0) {
    result += '${0}m';
  }
  return result;
}

// List<String> convertirHorasMinutos(double horas) {
//   int horasInt = horas.floor();
//   int minutosInt = ((horas - horasInt) * 60).round();
//   String horasString = horasInt.toString();
//   String minutosString = minutosInt.toString().padLeft(2, '0');
//   return [horasString, minutosString];
// }

List<String> convertDoubleToHourString(double input) {
  String inputString = input.toString();
  int indexOfDecimal = inputString.indexOf(".");
  String hours = inputString.substring(0, indexOfDecimal);
  String minutes = inputString.substring(indexOfDecimal + 1);
  if (minutes.length == 1) {
    minutes += "0";
  }
  return [hours, minutes];
}

List<String> splitHoursAndMinutes(String time) {
  List<String> parts = time.split(' ');
  String hours = '0h', minutes = '0m';
  if (parts.isNotEmpty) {
    hours = parts[0];
  }
  if (parts.length > 1) {
    minutes = parts[1];
  }
  return [hours, minutes];
}

class HourMinuteTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newString = newValue.text;
    if (newString.isNotEmpty) {
      final newHourMinute = int.tryParse(newString) ?? 0;
      if (newHourMinute > 59) {
        return oldValue;
      }
    }
    return newValue;
  }
}
