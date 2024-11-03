import 'dart:convert';

import 'package:agendamento_calendario/model/EventoModell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  DateTime _selecteDayDialog = DateTime.now();

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

  Future<void> _dataPicker() async {
    DateTime? _picked = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2025));
    if (_picked != null) {
      setState(() {
        _selecteDayDialog = _picked;
      });
      String dataFormatadaPicke =
          DateFormat('dd/MM/yyyy').format(_selecteDayDialog).toString();
      print('imprimindo selecao datapicker');
      print(dataFormatadaPicke);
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              contentPadding: EdgeInsets.all(10),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child:
                      Text('Confirmar ${dataFormatadaPicke} para Agendamento?'),
                ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.cancel),
                  label: Text('Cancelar'),
                ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.add_box),
                  label: Text('Confirmar'),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    EventoModeell eventoSelecionado;
    var count = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text('Gerenciador de Afastamentos'),
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
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        dataFormatada = DateFormat('yyyy-MM-dd')
                            .format(_selectedDay)
                            .toString();

                        print(
                            'printando o dia no calendario01 ${dataFormatada}');
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _dataPicker();
                  },
                  icon: const Icon(Icons.add),
                  label: Text('Novo Agendamento'),
                ),
              ],
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
