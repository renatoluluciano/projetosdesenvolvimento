import 'package:flutter/material.dart';

class ImagensPage extends StatelessWidget {
  const ImagensPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).devicePixelRatio);
    return Scaffold(
      appBar: AppBar(
        title: Text("Imagens"),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Center(
          child: Image.asset(
        'assets/imagem01.jpeg',
      )),
    );
  }
}
