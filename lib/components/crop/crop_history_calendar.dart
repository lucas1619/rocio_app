// text crop calendar

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/store/crop.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CropHistoryCalendar extends StatefulWidget {
  const CropHistoryCalendar({Key? key}) : super(key: key);
  @override
  CropHistoryCalendarState createState() => CropHistoryCalendarState();
}

class CropHistoryCalendarState extends State<CropHistoryCalendar> {
  final CalendarController _calendarController = CalendarController();

  bool _isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    _isDataLoaded = true;
  }

  @override
  Widget build(BuildContext context) {
    final cropStore = Provider.of<CropStore>(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: _isDataLoaded
          ? SfCalendar(
              timeZone: null,
              allowAppointmentResize: true,
              controller: _calendarController,
              dataSource: cropStore.source,
              view: CalendarView.month,
              onViewChanged: (viewChangedDetails) {
                Future.delayed(const Duration(seconds: 1), () {
                  cropStore.getCropHistory(
                      _calendarController.displayDate!.month,
                      _calendarController.displayDate!.year);
                });
              },
              monthViewSettings: const MonthViewSettings(
                showAgenda: true,
              ),
              headerStyle: const CalendarHeaderStyle(
                textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              viewHeaderStyle: const ViewHeaderStyle(
                dayTextStyle:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
              ),
              cellBorderColor: Colors.transparent,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
