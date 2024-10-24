import 'package:flutter/material.dart';
import 'package:flutter_navegacao/core/navigator_observer.dart';
import 'package:flutter_navegacao/pages/detalhe_page.dart';
import 'package:flutter_navegacao/pages/home_page.dart';

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

      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => HomePage(),
          );
        }
        if (settings.name == '/detalhe') {
          String? parametro = settings.arguments as String?;
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => Detalhe(
              parametro: parametro ?? 'Parametro em branco',
            ),
          );
        }
      },
      // routes: {
      //   //configuracao das rotas do app
      //   '/': (_) => HomePage(),
      //   '/detalhe': (_) => Detalhe()
      // },
    );
  }
}
