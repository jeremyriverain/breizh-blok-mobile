import 'package:breizh_blok_mobile/database/tables/db_requests.dart';
import 'package:drift/drift.dart';

class DbBoulderAreas extends Table {
  TextColumn get iri => text()();
  BoolColumn get isDownloaded => boolean()();
  TextColumn get boulders =>
      text().nullable().references(DbRequests, #requestPath)();
  DateTimeColumn get downloadedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {iri};
}
