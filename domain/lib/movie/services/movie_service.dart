import 'package:domain/movie/exception/not_found_movies.dart';
import 'package:domain/movie/model/movie.dart';
import 'package:domain/movie/repositories/movie_repository.dart';

import 'package:injectable/injectable.dart';

@injectable
class MovieService {
  MovieService({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  final MovieRepository _movieRepository;

  Future<List<Movie>> getUpComingMovies() async {
    final movies = await _movieRepository.getMovies();
    if (movies.isEmpty) {
      throw NotFoundMoviesException();
    }
    return movies;
  }
}
