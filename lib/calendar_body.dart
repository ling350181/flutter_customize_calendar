import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'util/date_util.dart';

class CalendarBody extends StatelessWidget {
  final int showCount;
  final List<DateTime> dates;
  @required
  final bool showBorder;
  final double childAspectRatio;
  final Function(dynamic) onPressed;
  final DateTime targetMonth;
  final DateTime selectedDay;
  final Widget child;

  CalendarBody(
      {Key key,
      this.showCount,
      this.dates,
      this.showBorder,
      this.childAspectRatio = 1.0,
      this.onPressed,
      this.targetMonth,
      this.selectedDay,
      this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(left: 5, right: 5), child: _buildGridViewWidget());
  }

  Color _designDateFont(bool isToday, DateTime day, bool isSelect) {
    if (isSelect) {
      return Colors.white;
    }
    if (!_isThisMonth(day)) {
      return Colors.grey;
    }
    if (isToday) {
      return Colors.white;
    }
    if (day.weekday == 6 || day.weekday == 7) {
      return Colors.red;
    }
    return Colors.black;
  }

  Widget _buildGridViewWidget() {
    return GridView.count(
      padding: EdgeInsets.only(top: 5),
      crossAxisCount: 7,
      crossAxisSpacing: 2.0, // 縦スペース
      mainAxisSpacing: 2.0, // 横スペース
      childAspectRatio: childAspectRatio,
      shrinkWrap: true,
      children: List.generate(showCount, (index) {
        bool isToday = _isToday(dates[index]);
        bool isSelected = false;
        if (selectedDay != null && DateUtil.isSameDay(selectedDay, dates[index])) {
          isSelected = true;
        }
        return GestureDetector(
          onTap: _isThisMonth(dates[index])
              ? () {
                  onPressed(dates[index]);
                }
              : null,
          child: Column(
            children: [
              Container(
                decoration: _designBorder(dates[index], isSelected),
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Text(dates[index].day.toString(),
                          style: TextStyle(fontSize: 20, color: _designDateFont(isToday, dates[index], isSelected))),
                    )),
              ),
              child ?? Container()
            ],
          ),
        );
      }),
    );
  }

  bool _isToday(DateTime dt) {
    return DateUtil.isSameDay(dt, DateTime.now());
  }

  bool _isThisMonth(DateTime dt) {
    if (dt.month == this.targetMonth.month && dt.year == dt.year) {
      return true;
    }
    return false;
  }

  Decoration _designBorder(DateTime dt, bool isSelected) {
    if (isSelected) {
      return BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      );
    }
    if (!_isToday(dt)) {
      if (!_isThisMonth(dt)) {
        return null;
      }
      if (showBorder) return BoxDecoration(border: Border.all(color: Colors.grey));
    } else {
      return BoxDecoration(color: Colors.red, shape: BoxShape.circle);
    }
    return null;
  }
}
