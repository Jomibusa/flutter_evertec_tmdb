//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injector.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:domain/movie/repositories/movie_repository.dart' as _i4;
import 'package:domain/movie/services/movie_service.dart' as _i3;
import 'package:injectable/injectable.dart' as _i1;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
class DomainPackageModule extends _i1.MicroPackageModule {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.MovieService>(
        () => _i3.MovieService(movieRepository: gh<_i4.MovieRepository>()));
  }
}
