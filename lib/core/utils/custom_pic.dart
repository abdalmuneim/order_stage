import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CustomPicker extends CommonPickerModel {
  CustomPicker({DateTime? currentTime, required LocaleType locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    setLeftIndex(0);
    setMiddleIndex(this.currentTime.minute);
    setRightIndex(this.currentTime.hour);
  }

  bool isAtSameDay(DateTime? day1, DateTime? day2) {
    return day1 != null &&
        day2 != null &&
        day1.difference(day2).inDays == 0 &&
        day1.day == day2.day;
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? leftStringAtIndex(int index) {
    DateTime time = currentTime.add(Duration(days: index));
    /*  if (minTime != null &&
        time.isBefore(minTime!) &&
        !isAtSameDay(minTime!, time)) {
      return null;
    } else if (maxTime != null &&
        time.isAfter(maxTime!) &&
        !isAtSameDay(maxTime, time)) {
      return null;
    } */
    // log('message' + currentTime.toString());
    dtime = time;
    day = time.day;
    return
        // time.toString();

        customFormatDatePic(time, [ymdw], locale);
  }

  int day = 0;
  DateTime dtime = DateTime.now();
  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return ":";
  }

  @override
  List<int> layoutProportions() {
    return [2, 1, 1];
  }

  @override
  DateTime finalTime() {
    DateTime time = currentTime.add(Duration(days: currentLeftIndex()));
    // log('message' + time.toString());

    return currentTime.isUtc
        ? DateTime.utc(currentTime.year, currentTime.month, currentTime.day,
            currentLeftIndex(), currentMiddleIndex(), 0)
        : time;
    //currentTime;
    // DateTime(time.year, time.month, time.day,
    // currentRightIndex(), currentMiddleIndex(), 0);
  }
}

String ymdw = 'ymdw';

String customFormatDatePic(
    DateTime date, List<String> formats, LocaleType locale) {
  if (formats.first == ymdw) {
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      //today
      return i18nObjInLocale(locale)['today'] as String;
    } else if (date.year == now.year) {
      return customFormatDatePic(date, ['D', ' ', 'M', ' ', 'dd'], locale);
    } else {
      return customFormatDatePic(
          date, ['D', ' ', 'M', ' ', 'dd', ', ', 'yyyy'], locale);
    }
  }

  final sb = StringBuffer();

  for (String format in formats) {
    if (format == 'yyyy') {
      sb.write(digits(date.year, 4));
    } else if (format == 'yy') {
      sb.write(digits(date.year % 100, 2));
    } else if (format == 'mm') {
      sb.write(digits(date.month, 2));
    } else if (format == 'm') {
      sb.write(date.month);
    } else if (format == 'MM') {
      final monthLong =
          i18nObjInLocaleLookup(locale, 'monthLong', date.month - 1);
      sb.write(monthLong);
    } else if (format == 'M') {
      final monthShort =
          i18nObjInLocaleLookup(locale, 'monthShort', date.month - 1);
      sb.write(monthShort);
    } else if (format == 'dd') {
      sb.write(digits(date.day, 2));
    } else if (format == 'd') {
      sb.write(date.day);
    } else if (format == 'w') {
      sb.write((date.day + 7) ~/ 7);
    } else if (format == 'W') {
      sb.write((dayInYear(date) + 7) ~/ 7);
    } else if (format == 'WW') {
      sb.write(digits((dayInYear(date) + 7) ~/ 7, 2));
    } else if (format == 'D') {
      String day = i18nObjInLocaleLookup(locale, 'day', date.weekday - 1);
      if (locale == LocaleType.ko) {
        day = "($day)";
      }
      sb.write(day);
    } else if (format == 'HH') {
      sb.write(digits(date.hour, 2));
    } else if (format == 'H') {
      sb.write(date.hour);
    } else if (format == 'hh') {
      sb.write(digits(date.hour % 12, 2));
    } else if (format == 'h') {
      sb.write(date.hour % 12);
    } else if (format == 'am') {
      sb.write(date.hour < 12
          ? i18nObjInLocale(locale)['am']
          : i18nObjInLocale(locale)['pm']);
    } else if (format == 'nn') {
      sb.write(digits(date.minute, 2));
    } else if (format == 'n') {
      sb.write(date.minute);
    } else if (format == 'ss') {
      sb.write(digits(date.second, 2));
    } else if (format == 's') {
      sb.write(date.second);
    } else if (format == 'SSS') {
      sb.write(digits(date.millisecond, 3));
    } else if (format == 'S') {
      sb.write(date.second);
    } else if (format == 'uuu') {
      sb.write(digits(date.microsecond, 2));
    } else if (format == 'u') {
      sb.write(date.microsecond);
    } else if (format == 'z') {
      if (date.timeZoneOffset.inMinutes == 0) {
        sb.write('Z');
      } else {
        if (date.timeZoneOffset.isNegative) {
          sb.write('-');
          sb.write(digits((-date.timeZoneOffset.inHours) % 24, 2));
          sb.write(digits((-date.timeZoneOffset.inMinutes) % 60, 2));
        } else {
          sb.write('+');
          sb.write(digits(date.timeZoneOffset.inHours % 24, 2));
          sb.write(digits(date.timeZoneOffset.inMinutes % 60, 2));
        }
      }
    } else if (format == 'Z') {
      sb.write(date.timeZoneName);
    } else {
      sb.write(format);
    }
  }

  return sb.toString();
}

int dayInYear(DateTime date) =>
    date.difference(DateTime(date.year, 1, 1)).inDays;

String digits(int value, int length) {
  return '$value'.padLeft(length, "0");
}

List<String> formatPattern = [
  'D',
  ' ',
  'yyyy',
  '-',
  'mm',
  '-',
  'dd',
  ' ',
  'HH',
  ':',
  'nn',
  ':',
  'ss'
];
