import 'package:domain/movie/model/movie.dart';
import 'package:infrastructure/movie/remote/implementation/up_coming_client.dart';
import 'package:infrastructure/movie/remote/repository/movie_remote_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieApiRepository extends MovieRemoteRepository {
  MovieApiRepository(this._apiProvider);
  final UpComingClient _apiProvider; 

  @override
  Future<List<Movie>> getUpComingMovies({int page = 1}) async {
    return await _apiProvider.getUpComingMovieList(page: page);
  }
}
