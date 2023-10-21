import 'package:domain/movie/model/movie.dart';
import 'package:drift/drift.dart';
import 'package:infrastructure/movie/local/database.dart';

mixin MovieTranslatorDomainToInfra {
  MovieCompanion parseMovieDomainToDB(Movie movie) {
    return MovieCompanion(
      originalTitle: Value(movie.originalTitle),
      title: Value(movie.title),
      overview: Value(movie.overview),
      backdropPath: Value(movie.backdropPath),
      posterPath: Value(movie.posterPath),
      releaseDate: Value(movie.releaseDate),
      originalLanguage: Value(movie.originalLanguage),
      adult: Value(movie.adult),
      voteAverage: Value(movie.voteAverage),
    );
  }
}
