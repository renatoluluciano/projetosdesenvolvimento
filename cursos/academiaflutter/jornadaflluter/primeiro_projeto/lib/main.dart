import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/pages/container/container_page.dart';
import 'package:flutter_primeiro_projeto/pages/forms/formulario.dart';
import 'package:flutter_primeiro_projeto/pages/home/home_page.dart';
import 'package:flutter_primeiro_projeto/pages/media_query/media_query_page.dart';
import 'package:flutter_primeiro_projeto/pages/rows_columns/rows_columns_page.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (_) => HomePage(),
          '/container': (_) => ContainerPage(),
          '/rows_columns': (_) => RowsColumnsPage(),
          '/media_query': (_) => MediaQueryPage(),
          '/formulario': (_) => Formulario(),
        });
  }
}
