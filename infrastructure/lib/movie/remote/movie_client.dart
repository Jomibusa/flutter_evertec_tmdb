import 'package:domain/domain.dart';

abstract class MovieClient {
  Future<List<Movie>> getUpComingMovieList({int page = 1});
}
