import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

extension DateExtensions on int {
  String fromMilisToDateString({String pattern = 'dd/MM/yyyy'}) {
    return DateFormat(pattern).format(
      DateTime.fromMillisecondsSinceEpoch(this),
    );
  }

  String fromMilisToDateTimeString({String pattern = 'dd/MM/yyyy HH:mm:ss'}) {
    return DateFormat(pattern).format(
      DateTime.fromMillisecondsSinceEpoch(this),
    );
  }
}

extension TimeOfDayExtensions on TimeOfDay {
  String formatToHourMinute() {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }
}
