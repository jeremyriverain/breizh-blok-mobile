import 'package:breizh_blok_mobile/database/tables/requests.dart';
import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Requests])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  Future<int> createOrUpdateRequest(Request request) {
    return into(requests).insertOnConflictUpdate(request);
  }

  Future<Request?> requestById(String id) {
    return (select(requests)..where((t) => t.requestPath.equals(id)))
        .getSingleOrNull();
  }
}
