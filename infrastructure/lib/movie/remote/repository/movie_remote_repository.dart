import 'package:domain/movie/model/movie.dart';

abstract class MovieRemoteRepository {
  Future<List<Movie>> getUpComingMovies({int page = 1});
  Future<List<Movie>> searchMovies(String query);
}
