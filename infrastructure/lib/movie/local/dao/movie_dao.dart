import 'package:drift/drift.dart';
import 'package:infrastructure/movie/local/database.dart';
import 'package:infrastructure/movie/local/tables/movie.dart';

part 'movie_dao.g.dart';

@DriftAccessor(tables: [Movie])
class MovieDao extends DatabaseAccessor<AppDatabase> with _$MovieDaoMixin {
  MovieDao(super.database);

  //Get all the movies from db
  Future<List<MovieData>> getMovieList() async {
    return select(movie).get();
  }

  //Get movie by id
  Future<MovieData> getMovie(int id) async {
    return (select(movie)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  //Insert new movie in db
  Future<int> insertMovie(MovieCompanion movieCompanion) async {
    return into(movie).insert(movieCompanion);
  }

  //Delete movie from db
  Future<int> deleteMovie(MovieData movieData) async {
    return delete(movie).delete(movieData);
  }

  //Delete all movies from db
  Future<int> deleteAllMovies() async {
    return delete(movie).go();
  }

  //Update movie in db
  Future<bool> updateMovie(MovieData movieData) async {
    return update(movie).replace(movieData);
  }

  Stream<MovieData> watchMovieWithId(int id) {
    return (select(movie)..where((u) => u.id.equals(id))).watchSingle();
  }
}
