import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class AttemptTable extends Table {
  TextColumn get uuid => text().clientDefault(() => const Uuid().v4())();
  IntColumn get boulderId => integer()();
  DateTimeColumn get attemptedAt => dateTime()();
  BoolColumn get isSuccess => boolean()();

  @override
  Set<Column> get primaryKey => {uuid};

  @override
  bool get isStrict => true;
}
