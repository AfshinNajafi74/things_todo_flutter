import 'package:persian_datetime_picker/persian_datetime_picker.dart';

extension DateFormatter on String{
  todayDataCustomFormat() {
    final result = Jalali.now().formatter;
    return "${result.wN} ${result.d} ${result.mN} ${result.yyyy}";
  }
  /// For the title of the weekly day
  // weeklyDataCustomFormat() {
  //   final result = Jalali.now().formatter;
  //   return "${result.mN}  ${result.yyyy} ";
  // }
}