import 'package:flutter/material.dart';
import 'package:gerenciador_estados/bloc_pattern/imc_blocPattern_page.dart';
import 'package:gerenciador_estados/changeNotifier/change_notifier.dart';
import 'package:gerenciador_estados/setState/imc_setstate_page.dart';
import 'package:gerenciador_estados/value_notifier/value_notifier_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _goToPage(context, const ImcSetstatePage()),
              child: Text('SetState'),
            ),
            ElevatedButton(
              onPressed: () => _goToPage(context, const ValueNotifierPage()),
              child: Text('ValueNotifier'),
            ),
            ElevatedButton(
              onPressed: () => _goToPage(context, const ChangeNotifierPage()),
              child: Text('ChangeNotifier'),
            ),
            ElevatedButton(
              onPressed: () => _goToPage(context, const ImcBlocPatternPage()),
              child: Text('Bloc Pattern (Streams)'),
            )
          ],
        ),
      ),
    );
  }
}
