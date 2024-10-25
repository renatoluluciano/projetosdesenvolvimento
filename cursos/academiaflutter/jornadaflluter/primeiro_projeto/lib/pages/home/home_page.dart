import 'package:flutter/material.dart';

enum PoupMenuPages {
  container,
  rows_columns,
  media_query,
}

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
              case PoupMenuPages.rows_columns:
                Navigator.of(context).pushNamed('/rows_columns');
                break;
              case PoupMenuPages.media_query:
                Navigator.of(context).pushNamed('/media_query');
                break;
            }
          }, itemBuilder: (BuildContext context) {
            return <PopupMenuItem<PoupMenuPages>>[
              PopupMenuItem<PoupMenuPages>(
                  value: PoupMenuPages.container, child: Text('Container')),
              PopupMenuItem<PoupMenuPages>(
                  value: PoupMenuPages.rows_columns,
                  child: Text('Rows & Columns')),
              PopupMenuItem<PoupMenuPages>(
                  value: PoupMenuPages.media_query, child: Text('MediaQuery'))
            ];
          })
        ],
      ),
      body: Container(),
    );
  }
}
