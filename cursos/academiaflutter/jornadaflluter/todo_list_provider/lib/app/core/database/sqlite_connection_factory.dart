import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class SqliteConnectionFactory {
  static const _VERSION = 1;
  static const _DATABASENAME = 'TODO_LIST_PROVIDER';

  static SqliteConnectionFactory? _instance;
  Database? _db;
  final _lock = Lock();

  SqliteConnectionFactory._();

  factory SqliteConnectionFactory() {
    if (_instance == null) {
      _instance = SqliteConnectionFactory._();
    }

    return _instance!;
  }

  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databasPathFinal = join(databasePath, _DATABASENAME);
    if (_db == null) {
      await _lock.synchronized(() async {
        if (_db == null) {
          _db = await openDatabase(databasPathFinal,
              version: _VERSION,
              onConfigure: _onConfigure,
              onCreate: _onCreate,
              onUpgrade: _onUpgrade,
              onDowngrade: _onDowgrade);
        }
      });
    }
    return _db!;
  }

  void closeConnection() {
    _db?.close();
    _db = null;
  }

  Future<void> _onConfigure(Database db) {}
  Future<void> _onCreate(Database db, int version) {}
  Future<void> _onUpgrade(Database db, int oldVersion, int version) {}
  Future<void> _onDowgrade(Database db, int oldVersion, int version) {}
}
