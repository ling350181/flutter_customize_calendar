import 'package:flutter/cupertino.dart';
import 'calendar_body.dart';
import 'day_of_week.dart';
import 'util/date_util.dart';

class FlutterCustomizeCalendar extends StatelessWidget {
  final String locale;
  final EdgeInsets weekdayMargin;
  final EdgeInsets weekdayPadding;
  final DateTime today;
  final DateTime targetMonth;
  final Function(dynamic) onPressed;
  final DateTime selectedDay;
  final List<String> footerTexts;
  final PageController pageController;
  final Function(int) onPageChanged;
  final double childAspectRatio;
  final Widget child;

  FlutterCustomizeCalendar(
      {Key key,
      this.locale,
      this.weekdayMargin,
      this.weekdayPadding,
      this.today,
      this.targetMonth,
      this.onPressed,
      this.selectedDay,
      this.footerTexts,
      this.pageController,
      this.onPageChanged,
      this.childAspectRatio = 1.0,
      this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height;
    int weekCount = DateUtil.weeksInMonth(this.targetMonth.month, this.targetMonth.year);
    height = weekCount < 6 ? 300 : 350;
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          DayOfWeek(
            locale: locale,
            weekdayMargin: weekdayMargin,
            weekdayPadding: weekdayPadding,
          ),
          _buildPageView()
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return Expanded(
        child: PageView.builder(
            onPageChanged: onPageChanged,
            controller: pageController,
            physics: new ScrollPhysics(),
            itemBuilder: (context, index) {
              return CalendarBody(
                showCount: DateUtil.weeksInMonth(targetMonth.month, targetMonth.year) * 7,
                dates: DateUtil.collectDateTime(targetMonth),
                showBorder: false,
                childAspectRatio: childAspectRatio,
                onPressed: onPressed,
                targetMonth: targetMonth,
                selectedDay: selectedDay,
                child: child,
              );
            }));
  }
}
