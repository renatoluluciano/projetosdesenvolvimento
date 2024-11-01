import 'package:agendamento_calendario/paginaHome.dart';
import 'package:agendamento_calendario/sreens/calendario_evento.dart';
import 'package:agendamento_calendario/teste_calendario/calendario_evento.dart';
import 'package:agendamento_calendario/teste_calendario/eventos.dart';
import 'package:agendamento_calendario/teste_calendario/listagemGeral.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afastamentos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => Calendario(),
        '/eventos': (_) => Eventos(),
        '/listagem': (_) => ListagemGeral(),
      },
    );
  }
}
