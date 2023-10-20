class ResultDto {
  ResultDto({
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
  });

  final String backdropPath;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final DateTime? releaseDate;
  final String title;
  final double voteAverage;
  final String originalLanguage;
  final bool adult;

  factory ResultDto.fromJson(Map<String, dynamic> json) => ResultDto(
        backdropPath: json['backdrop_path'] ?? '',
        id: json['id'],
        originalTitle: json['original_title'] ?? '',
        overview: json['overview'] ?? '',
        posterPath: json['poster_path'] ?? '',
        releaseDate: json["release_date"] != null &&
                json['release_date'].toString().isNotEmpty
            ? DateTime.parse(json["release_date"])
            : null,
        title: json['title'] ?? 'No Title',
        voteAverage: double.parse(json['vote_average'].toString()),
        originalLanguage: json['original_language'] ?? '',
        adult: json['adult'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'backdrop_path': backdropPath,
        'id': id,
        'original_title': originalTitle,
        'overview': overview,
        'poster_path': posterPath,
        'release_date': (releaseDate != null)
            ? "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}"
            : null,
        'title': title,
        'vote_average': voteAverage,
        'original_language': originalLanguage,
        'adult': adult
      };
}
