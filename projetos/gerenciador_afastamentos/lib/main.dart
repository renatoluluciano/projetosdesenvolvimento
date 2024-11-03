import 'package:flutter/material.dart';
import 'package:gerenciador_afastamentos/calendario/HomeCalendario.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade400),
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => const HomeCalendario(),
      },
    );
  }
}
