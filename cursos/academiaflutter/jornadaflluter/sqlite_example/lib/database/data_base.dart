import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseSqLite {
  Future<void> openConnection() async {
    var dataBasePath = await getDatabasesPath();

    final dataBaseFinalLite = join(dataBasePath, 'SQLITE_EXAMPLE');

    //estruturação do banco de dados SQLITE
    await openDatabase(
      dataBaseFinalLite,
      version: 1,
      //chamado somente no momento de criação do banco de Dados
      //primeira vez que carrega o aplicativo
      onCreate: (Database db, int version) {
        final batch = db.batch();

        batch.execute('''
          create table teste(
          id Integer primary key autoincrement,
          nome varchar(200)
          )
             ''');
      },
      //chamado sempre que houver uma alteracao no version, incremental
      onUpgrade: (Database db, int oldVersion, int version) {},
      //chamando sempre que houver uma modificacao no version para menos, decremental
      onDowngrade: (Database db, int oldVersion, int version) {},
    );
  }
}
