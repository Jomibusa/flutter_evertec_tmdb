import 'package:infrastructure/movie/remote/dto/result_dto.dart';

class MovieDto {
  MovieDto({
    required this.results,
    required this.page,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final int totalPages;
  final int totalResults;
  final List<ResultDto> results;

  factory MovieDto.fromJson(Map<String, dynamic> json) => MovieDto(
        page: json['page'],
        results: List<ResultDto>.from(
          json['results'].map((x) => ResultDto.fromJson(x)),
        ),
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
        'total_pages': totalPages,
        'total_results': totalResults,
      };
}
