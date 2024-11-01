import 'dart:convert';

import 'package:agendamento_calendario/model/EventoModell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  var eventos = <EventoModeell>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarEventos();
  }

  Future<void> _carregarEventos() async {
    final eventosJson =
        await rootBundle.loadString('assets/exemplo_marcacao.json');

    setState(() {
      List eventoList = json.decode(eventosJson);
      eventos = eventoList
          .map<EventoModeell>((lista) => EventoModeell.fromMap(lista))
          .toList();

      print(eventos);
    });
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
                  print('printando o dia no calendario ${_selectedDay}');
                  //_datasSelecionadas.add(
                  //  DateFormat('dd/MM/yyyy').format(DateTime.parse(evento.data)).toString());
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
              onPressed: () {
                var dataString =
                    DateFormat('yyyy-MM-dd').format(_selectedDay).toString();
                Navigator.of(context)
                    .pushNamed('/listagem', arguments: {'data': dataString});
              },
              child: const Text('Verificar'),
            ),
          )),
        )
      ]),
    );
  }
}