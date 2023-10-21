import 'package:domain/movie/model/movie.dart';
import 'package:flutter_evertec_tmdb/presentation/home/providers/movie_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieLocalProvider =
    StateNotifierProvider<MovieMapNotifier, Map<int, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieFromBD);
});

typedef GetMovieCallback = Future<Movie> Function(int movieID);

class MovieMapNotifier extends StateNotifier<Map<int, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(int movieID) async {
    if (state[movieID] != null) return;
    final movie = await getMovie(movieID);
    state = {...state, movieID: movie};
  }

}
