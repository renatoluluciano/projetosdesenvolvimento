import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class Eventos extends StatefulWidget {
  const Eventos({super.key});

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  late List<String> _datasSelecionadas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      final parametro =
          ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
      setState(() {
        _datasSelecionadas = parametro?['datas'] ?? 'Não foi dessa vez';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirmar agendamento'),
        ),
        body: Center(
          child: Container(
            width: mediaQuery.size.width * 0.5,
            height: mediaQuery.size.height * 0.5,
            color: Colors.amber.shade300,
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: _datasSelecionadas.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(
                    child: Text('${_datasSelecionadas[index]}'),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ));
  }
}
