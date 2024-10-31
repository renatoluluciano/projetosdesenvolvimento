import 'package:flutter/material.dart';

class CalendarioTestes extends StatefulWidget {
  const CalendarioTestes({super.key});

  @override
  State<CalendarioTestes> createState() => _CalendarioTestesState();
}

class _CalendarioTestesState extends State<CalendarioTestes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Agendamento'),
      ),
      body: Container(),
    );
  }
}
