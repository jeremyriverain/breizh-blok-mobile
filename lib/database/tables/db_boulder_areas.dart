import 'package:drift/drift.dart';

class DbBoulderAreas extends Table {
  TextColumn get iri => text()();
  BoolColumn get isDownloaded => boolean()();

  @override
  Set<Column> get primaryKey => {iri};
}
