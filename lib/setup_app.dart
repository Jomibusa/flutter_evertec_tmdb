import 'package:domain/movie/repositories/movie_repository.dart';
import 'package:infrastructure/movie/local/dao/movie_dao.dart';
import 'package:infrastructure/movie/local/dao/tracking_dao.dart';
import 'package:infrastructure/movie/local/database.dart';
import 'package:infrastructure/movie/local/repository/movie_drift_repository.dart';
import 'package:infrastructure/movie/remote/implementation/http_client.dart';
import 'package:infrastructure/movie/remote/implementation/up_coming_client.dart';
import 'package:infrastructure/movie/remote/repository/movie_api_repository.dart';
import 'package:infrastructure/movie/repository/movie_proxy.dart';

MovieRepository setUpApp() {
  final movieProvider = UpComingClient(configNetwork: HttpClient());
  final remoteRepository = MovieApiRepository(movieProvider);

  final database = AppDatabase.openConnection();
  final movieDao = MovieDao(database);
  final trackingDao = TrackingDao(database);
  final localRepository = MovieDriftRepository(movieDao, trackingDao);

  return MovieProxy(
    remoteRepository: remoteRepository,
    localRepository: localRepository,
  );
}
