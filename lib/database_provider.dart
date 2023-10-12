import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends InheritedWidget {
  const DatabaseProvider({
    required super.child,
    required this.database,
    super.key,
  });
  static DatabaseProvider of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<DatabaseProvider>();

    if (result == null) {
      throw Exception('No DatabaseProvider found');
    }

    return result;
  }

  final AppDatabase database;

  @override
  bool updateShouldNotify(DatabaseProvider oldWidget) {
    return false;
  }
}
