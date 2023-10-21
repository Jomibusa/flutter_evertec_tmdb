import 'package:drift/drift.dart';

class Tracking extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get date => text()();
}
