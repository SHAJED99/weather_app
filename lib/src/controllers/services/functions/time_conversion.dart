// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get custom_hh_mm_a => DateFormat('hh:mm a').format(toLocal());
  String get custom_hh_a => DateFormat('hh a').format(toLocal());
  String get custom_d_MMM_EEE => DateFormat('d MMM : EEE').format(toLocal());

  bool customIsSameHour({DateTime? otherDate}) {
    DateTime today = otherDate ?? DateTime.now();
    return today.year == year && today.month == month && today.day == day && today.hour == hour;
  }

  bool customIsSameDay({DateTime? otherDate}) {
    DateTime today = otherDate ?? DateTime.now();
    return today.year == year && today.month == month && today.day == day;
  }

  // TimeOfDay get customConvertToTimeOfDay => TimeOfDay(hour: hour, minute: minute);
}
