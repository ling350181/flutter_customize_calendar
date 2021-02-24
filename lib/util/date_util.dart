class DateUtil {
  /// 本周第一天
  static DateTime firstDayOfWeek(DateTime dt) {
    return dt.subtract(new Duration(days: dt.weekday));
  }

  /// 日历页本月第一格日期
  static DateTime firstDayOfMonth(DateTime dt) {
    DateTime time = DateTime(dt.year, dt.month, 1);
    if (time.weekday != 7) {
      return time.subtract(new Duration(days: time.weekday));
    }
    return time;
  }

  /// 闰年判断
  static bool leapYear(int year) {
    bool leapYear = false;

    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true)
      leapYear = false;
    else if (year % 4 == 0) leapYear = true;

    return leapYear;
  }

  static int daysInMonth(int monthNum, int year) {
    List<int> monthLength = new List(12);

    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear(year) == true)
      monthLength[1] = 29;
    else
      monthLength[1] = 28;

    return monthLength[monthNum - 1];
  }

  static int weeksInMonth(int monthNum, int year) {
    int firstDayWeek = DateTime(year, monthNum, 1).weekday;
    int firstDaysInFirstWeek = 7 - firstDayWeek;
    if (firstDayWeek != 7) {
      return ((daysInMonth(monthNum, year) - firstDaysInFirstWeek) / 7).ceil() + 1;
    }
    return (daysInMonth(monthNum, year) / 7).ceil();
  }

  static List<DateTime> collectDateTime(DateTime dt) {
    List<DateTime> list = [];
    // 本页第一天
    DateTime firstDayOfPage = firstDayOfMonth(dt);
    DateTime firstDay = DateTime(dt.year, dt.month, 1);
    int diff = firstDay.difference(firstDayOfPage).inDays;
    // 第一周
    if (diff != 7) {
      for (int i = 0; i < diff; i++) {
        list.add(firstDayOfPage);
        firstDayOfPage = firstDayOfPage.add(Duration(days: 1));
      }
    }
    // 本月
    int days = daysInMonth(dt.month, dt.year);
    for (int i = 0; i < days; i++) {
      list.add(firstDayOfPage);
      firstDayOfPage = firstDayOfPage.add(Duration(days: 1));
    }
    // 最后一周
    DateTime lastDay = DateTime(dt.year, dt.month, days);
    int index;
    if (lastDay.weekday < 7) {
      index = 6 - lastDay.weekday;
    } else {
      index = 6;
    }
    for (int i = 0; i < index; i++) {
      list.add(firstDayOfPage);
      firstDayOfPage = firstDayOfPage.add(Duration(days: 1));
    }
    return list;
  }

  static bool isSameDay(DateTime a, DateTime b) {
    if (a.difference(b).inDays == 0 && a.day == b.day) {
      return true;
    }
    return false;
  }
}
