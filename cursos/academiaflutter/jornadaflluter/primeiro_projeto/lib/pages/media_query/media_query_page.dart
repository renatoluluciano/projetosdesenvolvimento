import 'package:flutter/material.dart';

class MediaQueryPage extends StatelessWidget {
  const MediaQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    var appBar = AppBar(
      title: Text('Media Query'),
    );
    // obter o tamanho real da tela que vai ter para trabalhar tirando
    //o top e o appbar
    final statusBar = mediaQuery.padding.top;
    final heightBody = mediaQuery.size.height - statusBar - kToolbarHeight;

    return Scaffold(
      appBar: appBar,
      body: Center(
          child: Column(
        children: [
          Container(
            color: Colors.red,
            width: mediaQuery.size.width, //largura 100% da tela
            height: heightBody * .5,
          ),
          Container(
            color: Colors.blue,
            width: mediaQuery.size.width, //largura 100% da tela
            height: heightBody * .5,
          ),
        ],
      )),
    );
  }
}
