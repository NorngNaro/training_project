import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_project/helper/utils/translate.dart';

// * Device Info
Future<String> getDeviceId() async {
  final deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    final androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id;
  }
  if (Platform.isIOS) {
    final iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.utsname.sysname;
  }
  return 'Unknown';
}

Future<String> getDeviceName() async {
  final deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    final androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.model;
  }
  if (Platform.isIOS) {
    final iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.utsname.machine;
  }
  return 'Unknown';
}

// * Others
bool getCurrentLanguage(BuildContext context) {
  return context.locale == Translate.defaultLanguage ? true : false;
}

String? checkLength(
    String value, int length, String nullInfo, String lengthInfo) {
  if (value == '') {
    return nullInfo;
  } else if (value.length < length) {
    return lengthInfo;
  }
  return null;
}

bool selectValidation(String value) {
  if (value == 'Select') {
    return false;
  } else {
    return true;
  }
}

String? checkMatch(String value1, String value2, String matchInfo) {
  if (value1 != value2) {
    return matchInfo;
  }
  return null;
}

String calculateAge(DateTime birthDate, int type) {
  DateTime a = DateTime.now();
  DateTime b = birthDate;
  int totalDays = a.difference(b).inDays;
  int years = totalDays ~/ 365;
  int months = (totalDays - years * 365) ~/ 30;
  int days = totalDays - years * 365 - months * 30;

  if (type == 1) {
    return years.toString();
  } else if (type == 2) {
    return months.toString();
  } else {
    return days.toString();
  }
}

String ageDisplay(
  DateTime birthDate,
) {
  return '${calculateAge(birthDate, 1) == '0' ? '' : '${calculateAge(birthDate, 1)}Years'}  '
      '${calculateAge(birthDate, 2) == '0' ? '' : '${calculateAge(birthDate, 2)}Months'} '
      '${calculateAge(birthDate, 3) == '0' ? '' : '${calculateAge(birthDate, 3)}Days'}  ';
}

String convertToDateTime(int years, int months, int days) {
  int totalDays = ((years * 365) + (months * 30) + days);
  DateTime now = DateTime.now();
  Duration duration = Duration(days: totalDays);
  DateTime result = now.subtract(duration);
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  return formatter.format(result);
}

String greetingDashboard() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning!';
  }
  if (hour < 17) {
    return 'Good Afternoon!';
  }
  return 'Good Evening!';
}

// * Get Monday of the current week
DateTime getMondayOfCurrentWeek() => DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day - (DateTime.now().weekday - 1),
    );

// * Get Monday of the current week
DateTime getMondayOfCurrentWeek1(DateTime date) => DateTime(
      date.year,
      date.month,
      date.day - (date.weekday - 1),
    );

// * Get Saturday of the current week;
DateTime getSaturdayOfCurrentWeek() => DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + (DateTime.saturday - DateTime.now().weekday),
    );

// * Get Saturday of the current week;
DateTime getSaturdayOfCurrentWeek1(DateTime date) => DateTime(
      date.year,
      date.month,
      date.day + (DateTime.saturday - date.weekday),
    );


// * Calculate time ago
String convertToAgo(String dateTime) {
  DateTime input = DateFormat('yyyy-MM-DD HH:mm:ss').parse(dateTime);
  Duration diff = DateTime.now().difference(input);

  if (diff.inDays >= 1) {
    return '${diff.inDays}d ago';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours}h ago';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes}m ago';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds}s ago';
  } else {
    return 'just now';
  }
}
