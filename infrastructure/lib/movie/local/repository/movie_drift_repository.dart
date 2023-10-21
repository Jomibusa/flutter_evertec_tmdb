import 'package:domain/movie/model/movie.dart';
import 'package:infrastructure/movie/local/anticorruption/movie_translator_domain_to_infra.dart';
import 'package:infrastructure/movie/local/anticorruption/movie_translator_infra_to_domain.dart';
import 'package:infrastructure/movie/local/dao/movie_dao.dart';
import 'package:infrastructure/movie/local/repository/movie_local_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDriftRepository extends MovieLocalRepository
    with MovieTranslatorInfraToDomain, MovieTranslatorDomainToInfra {
  MovieDriftRepository(this._movieDao);
  final MovieDao _movieDao;

  @override
  Future<int> deleteAllMovies() async {
    return _movieDao.deleteAllMovies();
  }

  @override
  Future<void> insertMovie(Movie movie) async {
    await _movieDao.insertMovie(parseMovieDomainToDB(movie));
  }

  @override
  Future<Movie> getMovie(int id) async {
    var movie = await _movieDao.getMovie(id);
    return parseMovieDBToDomain(movie);
  }
}
