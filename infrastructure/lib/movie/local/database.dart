import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:infrastructure/movie/local/tables/movie.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Movie])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);
  AppDatabase.openConnection() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
