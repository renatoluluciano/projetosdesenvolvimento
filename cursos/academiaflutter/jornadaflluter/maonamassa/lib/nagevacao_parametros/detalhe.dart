import 'package:flutter/material.dart';

class Detalhe extends StatefulWidget {
  const Detalhe({super.key});

  @override
  State<Detalhe> createState() => _DetalheState();
}

class _DetalheState extends State<Detalhe> {
  int? id;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final paramentro =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      setState(() {
        id = paramentro?['id'] ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes')),
      body: Center(
        child: Text('O id passado foi: ${id}'),
      ),
    );
  }
}
