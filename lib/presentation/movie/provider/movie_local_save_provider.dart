import 'package:domain/movie/model/movie.dart';
import 'package:domain/movie/repositories/movie_repository.dart';
import 'package:flutter_evertec_tmdb/presentation/home/providers/movie_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieLocalSaveProvider =
    StateNotifierProvider<MovieMapNotifier, Map<int, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(movieRepository: movieRepository);
});

class MovieMapNotifier extends StateNotifier<Map<int, Movie>> {
  final MovieRepository movieRepository;

  MovieMapNotifier({required this.movieRepository}) : super({});

  Future<void> saveMovie(Movie movie) async {
    await movieRepository.saveMovieInBD(movie);
    final bool isMovieInBD = state[movie.id] != null;

    if (isMovieInBD) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
