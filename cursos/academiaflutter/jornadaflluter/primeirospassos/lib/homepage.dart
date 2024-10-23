import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
//Steless é uma estado que não muda. Componente Estatico

  String texto = "Estou no Staless";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(texto);
  }
}
