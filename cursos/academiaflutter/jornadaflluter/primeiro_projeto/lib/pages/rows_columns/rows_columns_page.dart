import 'package:flutter/material.dart';

class RowsColumnsPage extends StatelessWidget {
  const RowsColumnsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rows & Columns'),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.red,
            child: Row(
              children: [
                Text('Elemento 01'),
                Text('Elemento 02'),
                Text('Elemento 03'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
