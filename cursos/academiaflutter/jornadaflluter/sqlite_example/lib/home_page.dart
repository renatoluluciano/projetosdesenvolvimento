import 'package:flutter/material.dart';
import 'package:flutter_sqlite_example/database/data_base.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _dataBase();
  }

  Future<void> _dataBase() async {
    final dataBase = await DataBaseSqLite().openConnection();

    //dataBase.insert('teste', {'nome': 'Renato Luciano'});
    //dataBase.delete('teste', where: 'id = ?', whereArgs: ['1']);
    dataBase.update('teste', {'nome': 'Gael Luciano'},
        where: 'id = ?', whereArgs: ['2']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home Page'),
      ),
      body: Container(),
    );
  }
}
