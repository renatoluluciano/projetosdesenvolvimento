import 'package:flutter/material.dart';
import 'package:flutter_inherited/home/home_page.dart';
import 'package:flutter_inherited/model/user_model.dart';
import 'package:flutter_inherited/splash_page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserModel(
      name: 'Renato Luciano',
      imgAvatar:
          'https://voluntario.seape.df.gov.br/javax.faces.resource/imagens/penal_df-min.png.xhtml',
      birthDate: '25/07/1987',
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: {'/': (_) => SplashPage(), '/home': (_) => HomePage()}),
    );
  }
}
