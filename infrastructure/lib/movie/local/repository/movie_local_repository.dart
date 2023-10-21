import 'package:domain/movie/model/movie.dart';
import 'package:domain/movie/model/tracking.dart';

abstract class MovieLocalRepository {
  Future<List<Movie>> getMovieList();
  Future<void> insertMovies(List<Movie> movies);
  Future<int> deleteAllMovies();
  Future<List<Tracking>> getTracking();
  Future<int> insertTracking();
  Future<bool> updateTracking(Tracking tracking);
}
