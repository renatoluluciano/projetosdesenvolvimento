import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCalendario extends StatefulWidget {
  const HomeCalendario({super.key});

  @override
  State<HomeCalendario> createState() => _HomeCalendarioState();
}

CalendarFormat _calendarFormat = CalendarFormat.month;
DateTime _selectedDay = DateTime.now();
DateTime _focusedDay = DateTime.now();
DateTime _selecteDayDialog = DateTime.now();

class _HomeCalendarioState extends State<HomeCalendario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de Afastamentos'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                child: TableCalendar(
                  firstDay: DateTime(365),
                  lastDay: DateTime(2250),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
