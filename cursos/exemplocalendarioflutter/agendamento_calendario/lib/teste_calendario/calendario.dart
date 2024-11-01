import 'dart:convert';

import 'package:agendamento_calendario/model/EventoModell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Calendario2 extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario2> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String? _dataFormatada;
  List<EventoModeell> _eventos = [];

  @override
  void initState() {
    super.initState();
    _carregarEventos();
    initializeDateFormatting();
  }

  Future<void> _carregarEventos() async {
    final eventosJson =
        await rootBundle.loadString('assets/exemplo_marcacao.json');
    final List eventoList = json.decode(eventosJson);
    setState(() {
      _eventos =
          eventoList.map((lista) => EventoModeell.fromMap(lista)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamentos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
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
                  _dataFormatada =
                      DateFormat('yyyy-MM-dd').format(_selectedDay).toString();
                  print('Data selecionada: $_dataFormatada');
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            ListView.builder(
              itemCount: _eventos.length,
              itemBuilder: (context, index) {
                final evento = _eventos[index];

                if (evento.data == _dataFormatada) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 22, 20, 14),
                        ),
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Text('Nome: ${evento.nome}'),
                          Text(
                              'Data: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(evento.data)).toString()}'),
                          Text(
                              'Tipo de Afastamento: ${evento.tipoAfastamento}'),
                        ],
                      ),
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
