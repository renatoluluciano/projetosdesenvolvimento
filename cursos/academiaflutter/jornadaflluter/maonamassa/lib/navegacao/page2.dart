import 'package:flutter/material.dart';
import 'package:flutter_mao_namassa/navegacao/page3.dart';

class Page02 extends StatelessWidget {
  const Page02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 02'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      settings: RouteSettings(name: 'page3'),
                      builder: (context) => Page03()));
                },
                child: Text('Page 3 via Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Pop')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/page3');
                },
                child: Text('Page 3 via named'))
          ],
        ),
      ),
    );
  }
}
