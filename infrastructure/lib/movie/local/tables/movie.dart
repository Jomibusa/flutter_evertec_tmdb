import 'package:drift/drift.dart';

class Movie extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get originalTitle => text().named('original_title')();
  TextColumn get overview => text()();
  TextColumn get backdropPath => text().named('backdrop_path')();
  TextColumn get posterPath => text().named('poster_path')();
  TextColumn get title => text()();
  DateTimeColumn get releaseDate => dateTime().named('release_date')();
  RealColumn get voteAverage => real().named('vote_average')();
  TextColumn get originalLanguage => text().named('original_language')();
  BoolColumn get adult => boolean()();
}
