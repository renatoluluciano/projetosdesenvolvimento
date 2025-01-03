import 'package:flutter_todo_list/app/core/database/migrations/migration.dart';
import 'package:flutter_todo_list/app/core/database/migrations/migration_v1.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [
        MigrationV1(),
      ];

  List<Migration> getUpgradeMigration(int version) => [];
}
