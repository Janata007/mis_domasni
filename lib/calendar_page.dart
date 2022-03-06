import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab3/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  late final List<String> termini;

  CalendarPage(@required this.termini);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Твој календар"),
      ),
      body: SfCalendar(
        view: CalendarView.week,
        dataSource: ExamDataSource(getAppointments()),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> exams = <Appointment>[];
  final DateTime today = DateTime.now();
  for (int i = 0; i < trueDateList.length; i++) {
    final DateTime startTime = DateTime(
        trueDateList[i].year,
        trueDateList[i].month,
        trueDateList[i].day,
        trueDateList[i].hour,
        trueDateList[i].minute,
        trueDateList[i].second); //year, month, day, hour, minute, sec
    final DateTime endTime = startTime.add(const Duration(hours: 3));
    exams.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: predmetiList[i],
      color: Colors.deepOrange,
    ));
  }
  return exams;
}

class ExamDataSource extends CalendarDataSource {
  ExamDataSource(List<Appointment> source) {
    appointments = source;
  }
}
