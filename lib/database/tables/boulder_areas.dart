import 'package:drift/drift.dart';

class BoulderAreas extends Table {
  TextColumn get iri => text()();
  BoolColumn get isDownloaded => boolean()();

  @override
  Set<Column> get primaryKey => {iri};
}
