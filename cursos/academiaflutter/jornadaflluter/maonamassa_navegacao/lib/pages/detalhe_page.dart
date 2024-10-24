import 'package:flutter/material.dart';

class Detalhe extends StatelessWidget {
  final String parametro;

  const Detalhe({super.key, required this.parametro});

  @override
  Widget build(BuildContext context) {
    //var paramentro = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Center(child: Text(parametro)),
    );
  }
}
