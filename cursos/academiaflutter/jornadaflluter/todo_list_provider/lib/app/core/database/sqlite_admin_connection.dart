import 'package:flutter/material.dart';
import 'package:flutter_todo_list/app/core/database/sqlite_connection_factory.dart';

class SqliteAdminConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final connectionSqlite = SqliteConnectionFactory();

    switch (state) {
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        connectionSqlite.closeConnection();
        break;

      // TODO: Handle this case.
    }

    super.didChangeAppLifecycleState(state);
  }
}
