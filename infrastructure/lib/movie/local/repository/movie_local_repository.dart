import 'package:domain/domain.dart';

abstract class MovieLocalRepository {
  Future<List<Movie>> getMovieList();
  Future<void> insertMovies(List<Movie> movies);
  Future<int> deleteAllMovies();
  Future<List<Tracking>> getTracking();
  Future<int> insertTracking();
  Future<bool> updateTracking(Tracking tracking);
}
