import 'package:domain/movie/model/movie.dart';
import 'package:domain/movie/repositories/movie_repository.dart';
import 'package:infrastructure/movie/local/repository/movie_local_repository.dart';
import 'package:infrastructure/movie/remote/repository/movie_remote_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieProxy implements MovieRepository {
  MovieProxy({
    required MovieRemoteRepository remoteRepository,
    required MovieLocalRepository localRepository,
  })  : _localRepository = localRepository,
        _remoteRepository = remoteRepository;

  final MovieRemoteRepository _remoteRepository;
  final MovieLocalRepository _localRepository;

  static const _maxHoursPerDay = 24;

  @override
  Future<List<Movie>> getMovies({int page = 1}) async {
    final moviesDB = await _localRepository.getMovieList();
    if (moviesDB.isEmpty) {
      return _getMoviesFromApi();
    } else {
      final isOld = await _validateTrackingMovies();
      if (isOld) {
        await _localRepository.deleteAllMovies();
        return _getMoviesFromApi(page: page);
      } else if (page > 1) {
        return _getMoviesFromApi(page: page);
      } else {
        return moviesDB;
      }
    }
  }

  Future<List<Movie>> _getMoviesFromApi({int page = 1}) async {
    final movies = await _remoteRepository.getUpComingMovies(page: page);
    await _localRepository.insertMovies(movies);
    await _insertTracking();
    return movies;
  }

  Future<bool> _validateTrackingMovies() async {
    final tracking = await _localRepository.getTracking();
    final dateTime = DateTime.now();
    final dateTimeBD = DateTime.parse(tracking[0].date);
    final difference = dateTime.difference(dateTimeBD);
    if (difference.inHours >= _maxHoursPerDay) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _insertTracking() async {
    final tracking = await _localRepository.getTracking();
    if (tracking.isNotEmpty) {
      await _localRepository.updateTracking(tracking[0]);
    } else {
      await _localRepository.insertTracking();
    }
  }
}
