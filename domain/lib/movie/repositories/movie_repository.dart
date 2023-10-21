import 'package:domain/movie/model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({int page = 1});
}
