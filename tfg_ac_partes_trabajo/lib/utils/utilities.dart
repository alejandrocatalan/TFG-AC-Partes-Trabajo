// class NumericTextInputFormatter {
//   static final _instance = NumericTextInputFormatter._();

//   factory NumericTextInputFormatter() => _instance;

//   NumericTextInputFormatter._();

//   TextInputFormatter get formatter {
//     return FilteringTextInputFormatter.digitsOnly;
//   }
// }

String convertHours(double hours) {
  int wholeHours = hours.floor();
  int minutes = ((hours - wholeHours) * 60).round();
  String result = '';
  if (wholeHours > 0) {
    result += '${wholeHours}h ';
  }
  result += '${minutes}m';
  return result;
}
