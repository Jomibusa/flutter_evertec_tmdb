import 'package:domain/movie/model/movie.dart';
import 'package:domain/movie/model/tracking.dart';
import 'package:drift/drift.dart';
import 'package:infrastructure/movie/local/anticorruption/movie_translator_domain_to_infra.dart';
import 'package:infrastructure/movie/local/anticorruption/movie_translator_infra_to_domain.dart';
import 'package:infrastructure/movie/local/anticorruption/tracking_translator_infra_to_domain.dart';
import 'package:infrastructure/movie/local/dao/movie_dao.dart';
import 'package:infrastructure/movie/local/dao/tracking_dao.dart';
import 'package:infrastructure/movie/local/database.dart';
import 'package:infrastructure/movie/local/repository/movie_local_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDriftRepository extends MovieLocalRepository
    with
        MovieTranslatorInfraToDomain,
        MovieTranslatorDomainToInfra,
        TrackingTranslatorInfraToDomain {
  MovieDriftRepository(this._movieDao, this._trackingDao);
  final MovieDao _movieDao;
  final TrackingDao _trackingDao;

  @override
  Future<int> deleteAllMovies() async {
    return _movieDao.deleteAllMovies();
  }

  @override
  Future<List<Movie>> getMovieList() async {
    final movies = <Movie>[];
    final moviesDB = await _movieDao.getMovieList();
    if (moviesDB.isNotEmpty) {
      for (final movie in moviesDB) {
        movies.add(parseMovieDBToDomain(movie));
      }
    }
    return movies;
  }

  @override
  Future<void> insertMovies(List<Movie> movies) async {
    for (final element in movies) {
      await _movieDao.insertMovie(parseMovieDomainToDB(element));
    }
  }

  @override
  Future<List<Tracking>> getTracking() async {
    final tracking = <Tracking>[];
    final lisTracking = await _trackingDao.getTracking();
    for (final element in lisTracking) {
      tracking.add(parseTrackingDBToDomain(element));
    }
    return tracking;
  }

  @override
  Future<bool> updateTracking(Tracking tracking) {
    return _trackingDao.updateTracking(
      TrackingData(
        id: tracking.id,
        date: DateTime.now().toString(),
      ),
    );
  }

  @override
  Future<int> insertTracking() {
    return _trackingDao.insertTracking(
      TrackingCompanion(
        date: Value(DateTime.now().toString()),
      ),
    );
  }
}
