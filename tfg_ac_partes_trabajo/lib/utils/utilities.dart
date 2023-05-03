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
