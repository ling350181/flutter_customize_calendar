import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DayOfWeek extends StatelessWidget{
  final TextStyle weekDayTextStyle;
  final String locale;
  final EdgeInsets weekdayMargin;
  final EdgeInsets weekdayPadding;

  DayOfWeek({Key key,
    this.weekDayTextStyle,
    this.locale,
    this.weekdayMargin,
    this.weekdayPadding
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _renderWeekDays(),
    );
  }

  List<Widget> _renderWeekDays() {
    initializeDateFormatting();
    List<Widget> list = [];
    for(int i =0;i<7;i++){
      String weekDayName;
      weekDayName = DateFormat.yMMMd(this.locale ?? "en").dateSymbols.SHORTWEEKDAYS[i];
      list.add(_weekDayContainer(weekDayName));
    }
    return list;
  }

  Widget _weekDayContainer(String weekDayName){
    return Expanded(
        child: Container(
          margin: weekdayMargin,
          padding: weekdayPadding,
          child: Center(
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 14.0,
              ),
              child: Text(
                weekDayName,
                semanticsLabel: weekDayName,
                //style: weekDayTextStyle,
              ),
            ),
          ),
        )
    );
  }
}
