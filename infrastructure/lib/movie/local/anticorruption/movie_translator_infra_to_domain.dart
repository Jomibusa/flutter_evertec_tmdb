import 'package:domain/movie/model/movie.dart';
import 'package:infrastructure/movie/local/database.dart';

mixin MovieTranslatorInfraToDomain {
  Movie parseMovieDBToDomain(MovieData movieData) {
    return Movie(
      backdropPath: movieData.backdropPath,
      id: movieData.id,
      originalTitle: movieData.originalTitle,
      overview: movieData.overview,
      posterPath: movieData.posterPath,
      releaseDate: movieData.releaseDate,
      title: movieData.title,
      voteAverage: movieData.voteAverage,
      adult: movieData.adult,
      originalLanguage: movieData.originalLanguage,
    );
  }
}
