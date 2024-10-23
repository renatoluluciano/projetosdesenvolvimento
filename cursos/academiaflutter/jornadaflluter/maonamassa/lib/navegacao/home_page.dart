import 'package:flutter/material.dart';
import 'package:flutter_mao_namassa/navegacao/page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOMEPAGE Navegacao'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      settings: RouteSettings(name: 'page2'),
                      builder: (context) => Page02()));
                },
                child: Text('Page 2 via Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/page2');
                },
                child: Text('Page 2 via Named')),
          ],
        ),
      ),
    );
  }
}
