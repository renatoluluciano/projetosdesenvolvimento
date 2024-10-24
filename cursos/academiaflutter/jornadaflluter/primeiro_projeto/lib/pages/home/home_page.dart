import 'package:flutter/material.dart';

enum PoupMenuPages { container }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          PopupMenuButton<PoupMenuPages>(
              onSelected: (PoupMenuPages valueSelected) {
            switch (valueSelected) {
              case PoupMenuPages.container:
                Navigator.of(context).pushNamed('/container');

                break;
            }
          }, itemBuilder: (BuildContext context) {
            return <PopupMenuItem<PoupMenuPages>>[
              PopupMenuItem<PoupMenuPages>(
                  value: PoupMenuPages.container, child: Text('Container'))
            ];
          })
        ],
      ),
      body: Container(),
    );
  }
}
