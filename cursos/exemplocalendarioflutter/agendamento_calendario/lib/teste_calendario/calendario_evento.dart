import 'dart:convert';

import 'package:agendamento_calendario/model/EventoModell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:intl/intl.dart';

class Calendario extends StatefulWidget {
  @override
  _Calendario01State createState() => _Calendario01State();
}

class _Calendario01State extends State<Calendario> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String? dataFormatada;
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
    });
  }

  Container _listaAgendados(
      List<EventoModeell> eventos, dynamic dataSelecionada) {
    print(
        'Dentro do metodo data selecionada: dataSelecionada: ${dataSelecionada}');
    final mapAgendados = <String, String>{};
    for (var evento in eventos) {
      var nome = evento.nome;
      var data = evento.data;
      var afastamentoTipo = evento.tipoAfastamento;
      print('No For nome: ${nome} , data: ${data} ');
      if (dataSelecionada == data) {}
      mapAgendados['nome'] = nome;
      mapAgendados['data'] = data;
      mapAgendados['tipoAfastamentno'] = afastamentoTipo;
    }
    return Container(
      child: Text('${mapAgendados}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    EventoModeell eventoSelecionado;
    var count = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text('Agendamentos'),
        ),
        body: Column(
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
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    dataFormatada = DateFormat('yyyy-MM-dd')
                        .format(_selectedDay)
                        .toString();

                    print('printando o dia no calendario01 ${dataFormatada}');
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: eventos.length,
                  itemBuilder: (context, index) {
                    var evento = eventos[index];
                    while (count < eventos.length) {
                      if (evento.data == dataFormatada) {
                        eventoSelecionado = eventos[index];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text('Nome: ${eventoSelecionado.nome} '),
                              subtitle: Text(
                                  'Afastamento: ${eventoSelecionado.tipoAfastamento}'),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {}, child: Text('Excluir')),
                              ),
                            ));
                      }

                      return Container();
                    }
                  }),
            )
          ],
        ));
  }
}
