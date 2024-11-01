import 'dart:convert';

import 'package:agendamento_calendario/model/EventoModell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListagemGeral extends StatefulWidget {
  const ListagemGeral({super.key});

  @override
  State<ListagemGeral> createState() => _ListagemGeralState();
}

class _ListagemGeralState extends State<ListagemGeral> {
  var eventos = <EventoModeell>[];
  String? dataSelecionada;
  //String? dataSelecionadaFormat;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final dataParametro =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      setState(() {
        dataSelecionada = dataParametro?['data'] ?? '00/00/0000';
      });
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listagem do Json'),
        ),
        body: ListView.builder(
            itemCount: eventos.length,
            itemBuilder: (context, index) {
              var evento = eventos[index];

              print('Data da Lista: ${evento.data}');
              print('Data Calendario: ${dataSelecionada}');

              return ListTile(
                title: Text('Nome: ${evento.nome} '),
                subtitle: Text('Data: ${evento.data}'),
              );
            }));
  }
}
