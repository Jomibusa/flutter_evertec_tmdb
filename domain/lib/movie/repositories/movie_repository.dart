import 'package:domain/movie/model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({int page = 1});
  Future<void> saveMovieInBD(Movie movie);
  Future<Movie> getMovieFromBD(int id);
  Future<Movie> getMovieByID(String id);
  Future<List<Movie>> searchMovies(String query);
}
