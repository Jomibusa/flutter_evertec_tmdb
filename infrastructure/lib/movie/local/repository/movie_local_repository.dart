import 'package:domain/domain.dart';

abstract class MovieLocalRepository {
  Future<Movie> getMovie(int id);
  Future<void> insertMovie(Movie movie);
  Future<int> deleteAllMovies();
}
