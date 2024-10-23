import 'package:flutter/material.dart';
import 'package:flutter_mao_namassa/nagevacao_parametros/detalhe.dart';
import 'package:flutter_mao_namassa/nagevacao_parametros/lista.dart';
import 'package:flutter_mao_namassa/navegacao/home_page.dart';
import 'package:flutter_mao_namassa/navegacao/page1.dart';
import 'package:flutter_mao_namassa/navegacao/page2.dart';
import 'package:flutter_mao_namassa/navegacao/page3.dart';
import 'package:flutter_mao_namassa/navegacao/page4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        //home: HomePage(),
        initialRoute: '/navegacao_parametros',
        routes: {
          '/': (_) => HomePage(),
          '/page1': (_) => Page01(),
          '/page2': (_) => Page02(),
          '/page3': (_) => Page03(),
          '/page4': (_) => Page04(),
          '/navegacao_parametros': (_) => Lista(),
          '/detalhe': (_) => Detalhe()
        });
  }
}
