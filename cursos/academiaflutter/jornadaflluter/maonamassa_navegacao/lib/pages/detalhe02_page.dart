import 'package:flutter/material.dart';

class Detalhe02Page extends StatelessWidget {
  const Detalhe02Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhe02'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pop('Parametro retornado pela pagina Detalhe02');
            },
            child: Text('Voltar')),
      ),
    );
  }
}
