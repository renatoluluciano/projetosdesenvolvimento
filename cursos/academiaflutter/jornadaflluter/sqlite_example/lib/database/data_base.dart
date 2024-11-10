import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseSqLite {
  Future<Database> openConnection() async {
    final dataBasePath = await getDatabasesPath();

    final dataBaseFinalLite = join(dataBasePath, 'SQLITE_EXAMPLE');

    //estruturação do banco de dados SQLITE
    return await openDatabase(
      dataBaseFinalLite,
      version: 2,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      //chamado somente no momento de criação do banco de Dados

      onCreate: (Database db, int version) {
        print('acessando on creat');
        final batch = db.batch();

        batch.execute('''
          create table teste(
          id Integer primary key autoincrement,
          nome varchar(200)
          )
             ''');

        batch.execute('''
          create table produto(
          id Integer primary key autoincrement,
          nome varchar(200)
          )
             ''');

        // batch.execute('''
        //   create table categoria(
        //   id Integer primary key autoincrement,
        //   nome varchar(200)
        //   )
        //      ''');

        batch.commit();
      },
      //chamado sempre que houver uma alteracao no version, incremental
      onUpgrade: (Database db, int oldVersion, int version) {
        final batch = db.batch();

        if (oldVersion == 1) {
          batch.execute('''
          create table produto(
          id Integer primary key autoincrement,
          nome varchar(200)
          )
             ''');
        }

        // if (oldVersion == 2) {
        //   batch.execute('''
        //   create table categoria(
        //   id Integer primary key autoincrement,
        //   nome varchar(200)
        //   )
        //      ''');
        // }

        batch.commit();
      },
      //chamando sempre que houver uma modificacao no version para menos, decremental
      onDowngrade: (Database db, int oldVersion, int version) {
        final batch = db.batch();

        if (oldVersion == 3) {
          batch.execute('''

            drop table categoria


              ''');
        }

        batch.commit();
      },
    );
  }
}
