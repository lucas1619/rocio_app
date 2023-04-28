// text crop calendar

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CropHistoryCalendar extends StatefulWidget {
  const CropHistoryCalendar({Key? key}) : super(key: key);
  @override
  _CropHistoryCalendarState createState() => _CropHistoryCalendarState();
}

class _CropHistoryCalendarState extends State<CropHistoryCalendar> {
  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: SfCalendar(
          controller: _calendarController,
          onViewChanged: (viewChangedDetails) {
            print(_calendarController.displayDate!.month);
            print(_calendarController.displayDate!.year);
          },
          view: CalendarView.month,
          headerStyle: const CalendarHeaderStyle(
            textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          viewHeaderStyle: const ViewHeaderStyle(
            dayTextStyle:
                TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          ),
          cellBorderColor: Colors.transparent,
        ));
  }
}
