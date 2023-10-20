import 'package:domain/movie/exception/empty_exception.dart';

class Movie {
  Movie({
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.originalLanguage,
    required this.adult,
  }) {
    _validateEmptyFields();
    voteAverage = voteAverage / 2;
  }
  final String backdropPath;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  double voteAverage;
  final String originalLanguage;
  final bool adult;

  void _validateEmptyFields() {
    if (title.isEmpty) throw EmptyException();
    if (originalTitle.isEmpty) throw EmptyException();
    if (overview.isEmpty) throw EmptyException();
    if (posterPath.isEmpty) throw EmptyException();
    if (releaseDate.isEmpty) throw EmptyException();
    if (originalLanguage.isEmpty) throw EmptyException();
  }

  Movie copyWith({
    String? backdropPath,
    int? id,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? releaseDate,
    String? title,
    double? voteAverage,
    String? originalLanguage,
    bool? adult,
  }) {
    return Movie(
      backdropPath: backdropPath ?? this.backdropPath,
      id: id ?? this.id,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      adult: adult ?? this.adult,
    );
  }
}
