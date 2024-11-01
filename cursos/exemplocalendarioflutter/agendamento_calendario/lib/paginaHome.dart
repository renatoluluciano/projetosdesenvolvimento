import 'package:flutter/material.dart';

class PaginaHome extends StatelessWidget {
  const PaginaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Container(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/listagem');
            },
            child: Text('Listar Json')),
      ),
    );
  }
}
