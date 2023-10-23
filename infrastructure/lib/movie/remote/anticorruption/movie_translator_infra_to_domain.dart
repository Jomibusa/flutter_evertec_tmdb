import 'package:domain/movie/model/movie.dart';
import 'package:infrastructure/movie/remote/anticorruption/enum_genres.dart';
import 'package:infrastructure/movie/remote/dto/result_dto.dart';

mixin MovieTranslatorInfraToDomain {
  Movie parseMovieApiToDomain(ResultDto resultDto) {
    return Movie(
        backdropPath: (resultDto.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${resultDto.backdropPath}'
            : 'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg',
        id: resultDto.id,
        originalTitle: resultDto.originalTitle,
        overview: resultDto.overview,
        posterPath: (resultDto.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${resultDto.posterPath}'
            : 'https://movieeo.com/no-poster.png',
        releaseDate: resultDto.releaseDate != null
            ? resultDto.releaseDate!
            : DateTime.now(),
        title: resultDto.title,
        voteAverage: resultDto.voteAverage,
        originalLanguage: resultDto.originalLanguage,
        adult: resultDto.adult,
        genres: _paseGenresToDomain(resultDto.genreIds));
  }

  String _paseGenresToDomain(List<int> genresID) {
    List<String> genresMovie = [];
    for (var genreID in genresID) {
      genresMovie.add((GenresMovies.getByCode(genreID)).description);
    }
    return genresMovie.join(",");
  }
}
