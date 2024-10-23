import 'package:flutter/material.dart';
import 'package:flutter_mao_namassa/navegacao/page4.dart';

class Page03 extends StatelessWidget {
  const Page03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 03'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      settings: RouteSettings(name: 'page4'),
                      builder: (context) => Page04()));
                },
                child: Text('Page 4 via Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Pop')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/page4');
                },
                child: Text('Page 4 via named'))
          ],
        ),
      ),
    );
  }
}
