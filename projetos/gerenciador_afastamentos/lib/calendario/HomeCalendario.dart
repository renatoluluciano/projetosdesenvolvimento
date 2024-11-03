import 'package:flutter/material.dart';

class HomeCalendario extends StatefulWidget {
  const HomeCalendario({super.key});

  @override
  State<HomeCalendario> createState() => _HomeCalendarioState();
}

class _HomeCalendarioState extends State<HomeCalendario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geranciador de Afastamentos'),
      ),
      body: Container(),
    );
  }
}
