import 'package:flutter/material.dart';
import 'package:flutter_mao_namassa/navegacao/page1.dart';

class Page04 extends StatelessWidget {
  const Page04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 04'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          settings: RouteSettings(name: 'page1'),
                          builder: (context) => Page01()),
                      ModalRoute.withName('page2'));
                },
                child: Text('Page 1 via Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          settings: RouteSettings(name: 'page1'),
                          builder: (context) => Page01()),
                      (route) => route
                          .isFirst); //se route.false fecha toda a pilha de pages
                },
                child: Text('Page 1 via Page deixa home')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/page1', ModalRoute.withName('/'));
                  //se route.false fecha toda a pilha de pages
                },
                child: Text('Voltar para paginas via named')),
          ],
        ),
      ),
    );
  }
}
