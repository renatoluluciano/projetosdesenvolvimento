import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  List<String> _datasSelecionadas = [];

  ElevatedButton _confirmarEvento(DateTime _diaSelecionado) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            _datasSelecionadas.add(
                DateFormat('dd/MM/yyyy').format(_diaSelecionado).toString());
          });
        },
        child: Text('Confirmar marcação'));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento'),
      ),
      body: Column(children: [
        Center(
          child: Container(
            color: Colors.green.shade200,
            child: TableCalendar(
              firstDay: DateTime(365),
              lastDay: DateTime(2250),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;

                  //_datasSelecionadas.add(
                  //  DateFormat('dd/MM/yyyy').format(_selectedDay).toString());
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),

            // FloatingActionButton(
            //   onPressed: () {},
            //   tooltip: 'Imprimir datas selecionadas',
            //   child: Icon(Icons.download),
            // ),
          ),
        ),
        Expanded(
          child: Center(
              child: Container(
            height: 50,
            color: Colors.red.shade300,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                  'Data Selecionada ${DateFormat('dd/MM/yyyy').format(_selectedDay).toString()}'),
            ),
          )),
        )
      ]),
    );
  }
}
