//@GeneratedMicroModule;InfrastructurePackageModule;package:infrastructure/di/injector.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:http/http.dart' as _i12;
import 'package:infrastructure/movie/local/dao/movie_dao.dart' as _i6;
import 'package:infrastructure/movie/local/dao/tracking_dao.dart' as _i7;
import 'package:infrastructure/movie/local/repository/movie_drift_repository.dart'
    as _i5;
import 'package:infrastructure/movie/local/repository/movie_local_repository.dart'
    as _i10;
import 'package:infrastructure/movie/remote/config_network.dart' as _i3;
import 'package:infrastructure/movie/remote/implementation/http_client.dart'
    as _i4;
import 'package:infrastructure/movie/remote/implementation/up_coming_client.dart'
    as _i11;
import 'package:infrastructure/movie/remote/repository/movie_api_repository.dart'
    as _i13;
import 'package:infrastructure/movie/remote/repository/movie_remote_repository.dart'
    as _i9;
import 'package:infrastructure/movie/repository/movie_proxy.dart' as _i8;
import 'package:injectable/injectable.dart' as _i1;

const String _prod = 'prod';
const String _dev = 'dev';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
class InfrastructurePackageModule extends _i1.MicroPackageModule {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.ConfigNetwork>(
      () => _i4.HttpClient(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i5.MovieDriftRepository>(() => _i5.MovieDriftRepository(
          gh<_i6.MovieDao>(),
          gh<_i7.TrackingDao>(),
        ));
    gh.factory<_i8.MovieProxy>(() => _i8.MovieProxy(
          remoteRepository: gh<_i9.MovieRemoteRepository>(),
          localRepository: gh<_i10.MovieLocalRepository>(),
        ));
    gh.factory<_i11.UpComingClient>(() => _i11.UpComingClient(
          configNetwork: gh<_i3.ConfigNetwork>(),
          client: gh<_i12.Client>(),
        ));
    gh.factory<_i13.MovieApiRepository>(
        () => _i13.MovieApiRepository(gh<_i11.UpComingClient>()));
  }
}
