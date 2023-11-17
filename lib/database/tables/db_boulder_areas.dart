import 'package:breizh_blok_mobile/database/tables/db_requests.dart';
import 'package:drift/drift.dart';

class DbBoulderAreas extends Table {
  TextColumn get iri => text()();
  BoolColumn get isDownloaded => boolean()();
  TextColumn get boulders =>
      text().nullable().references(DbRequests, #requestPath)();

  @override
  Set<Column> get primaryKey => {iri};
}
