//@GeneratedMicroModule;InfrastructurePackageModule;package:infrastructure/di/injector.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:http/http.dart' as _i11;
import 'package:infrastructure/movie/local/dao/movie_dao.dart' as _i5;
import 'package:infrastructure/movie/local/repository/movie_drift_repository.dart'
    as _i4;
import 'package:infrastructure/movie/local/repository/movie_local_repository.dart'
    as _i8;
import 'package:infrastructure/movie/remote/config_network.dart' as _i10;
import 'package:infrastructure/movie/remote/implementation/http_client.dart'
    as _i3;
import 'package:infrastructure/movie/remote/implementation/up_coming_client.dart'
    as _i9;
import 'package:infrastructure/movie/remote/repository/movie_api_repository.dart'
    as _i12;
import 'package:infrastructure/movie/remote/repository/movie_remote_repository.dart'
    as _i7;
import 'package:infrastructure/movie/repository/movie_proxy.dart' as _i6;
import 'package:injectable/injectable.dart' as _i1;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
class InfrastructurePackageModule extends _i1.MicroPackageModule {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.HttpClient>(() => _i3.HttpClient());
    gh.factory<_i4.MovieDriftRepository>(
        () => _i4.MovieDriftRepository(gh<_i5.MovieDao>()));
    gh.factory<_i6.MovieProxy>(() => _i6.MovieProxy(
          remoteRepository: gh<_i7.MovieRemoteRepository>(),
          localRepository: gh<_i8.MovieLocalRepository>(),
        ));
    gh.factory<_i9.UpComingClient>(() => _i9.UpComingClient(
          configNetwork: gh<_i10.ConfigNetwork>(),
          client: gh<_i11.Client>(),
        ));
    gh.factory<_i12.MovieApiRepository>(
        () => _i12.MovieApiRepository(gh<_i9.UpComingClient>()));
  }
}
