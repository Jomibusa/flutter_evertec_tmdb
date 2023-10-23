import 'package:domain/domain.dart';

abstract class MovieClient {
  Future<List<Movie>> getUpComingMovieList({int page = 1});
  Future<List<Movie>> searchMovies(String query);
}
