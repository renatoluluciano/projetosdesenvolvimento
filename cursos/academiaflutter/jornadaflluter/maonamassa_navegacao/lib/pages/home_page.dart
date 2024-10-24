import 'package:flutter/material.dart';
import 'package:flutter_navegacao/pages/detalhe_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/detalhe',
                      arguments: 'Argumento da HomePage PushNamed.');
                },
                child: Text('Pagina de Detalhes')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      settings: RouteSettings(
                        name: '/detalhe',
                        //arguments: 'PAramentro passado'
                      ),
                      builder: (_) =>
                          Detalhe(parametro: 'PArametro Page router')));
                },
                child: Text('Detalhe PageRoute')),
            ElevatedButton(
                onPressed: () async {
                  var menssagem =
                      await Navigator.of(context).pushNamed('/detalhe02');
                  print('mensagem recebida da pagina ${menssagem}');
                },
                child: Text('Pagina Detalhe02')),
          ],
        ),
      ),
    );
  }
}
