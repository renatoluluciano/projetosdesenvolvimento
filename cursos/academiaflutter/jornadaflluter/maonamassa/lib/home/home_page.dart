import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar aqui."),
        backgroundColor: Colors.blue.shade100,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_link)),
        ],
      ),
      drawer: Drawer(
        child: Center(
          child: Text("Aberto"),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.amber.shade300,
              borderRadius: BorderRadius.all(Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                ),
              ]),
        ),
      ),
    );
  }
}


//container seria uma caixa, exemplo bem proximo do <div> html.
//magin é a margem externa do container, padding é a margem interna
//boxdecoration, a decoraçao deve ser dentro