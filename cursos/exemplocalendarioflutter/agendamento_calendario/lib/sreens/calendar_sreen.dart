import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarSreen extends StatefulWidget {
  const CalendarSreen({super.key});

  @override
  State<CalendarSreen> createState() => _CalendarSreensState();
}

class _CalendarSreensState extends State<CalendarSreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  List<DateTime> _datasSelecionadas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de Afastamentos'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: _focusedDay,
            lastDay: DateTime(2250),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _datasSelecionadas.add(_selectedDay);
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/eventos', arguments: {'datas': _selectedDay});
            },
            tooltip: 'Imprimir datas selecionadas',
            child: Icon(Icons.print),
          ),
        ],
      ),
    );
  }
}
