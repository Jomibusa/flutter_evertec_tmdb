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

  @override
  Future<List<Movie>> getMovies({int page = 1}) async =>
      await _remoteRepository.getUpComingMovies(page: page);

  @override
  Future<void> saveMovieInBD(Movie movie) async =>
      await _localRepository.insertMovie(movie);

  @override
  Future<Movie> getMovieByID(String id) async =>
      await _remoteRepository.getMovieByID(id);

  @override
  Future<Movie> getMovieFromBD(int id) async =>
      await _localRepository.getMovie(id);

  @override
  Future<List<Movie>> searchMovies(String query) async =>
      await _remoteRepository.searchMovies(query);
}
