import 'dart:convert';

import 'package:domain/movie/model/movie.dart';
import 'package:http/http.dart' show Client;
import 'package:infrastructure/movie/remote/anticorruption/movie_translator_infra_to_domain.dart';
import 'package:infrastructure/movie/remote/config_network.dart';
import 'package:infrastructure/movie/remote/dto/movie_dto.dart';
import 'package:infrastructure/movie/remote/implementation/http_client.dart';
import 'package:infrastructure/movie/remote/movie_client.dart';
import 'package:infrastructure/movie/remote/utils/status_code_enum.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpComingClient extends MovieClient with MovieTranslatorInfraToDomain {
  UpComingClient({required ConfigNetwork configNetwork, Client? client})
      : _configNetwork = configNetwork,
        _client = client ?? Client();
  final Client _client;
  final ConfigNetwork _configNetwork;

  static const _apiKey = '762b9efc4b62d1f246b562cd71740148';

  @override
  Future<List<Movie>> getUpComingMovieList({int page = 1}) async {
    final url = Uri.parse(
      '${_configNetwork.baseUrl}${_configNetwork.path}?api_key=$_apiKey&language=en-MX&page=$page',
    );
    final response = await _client.get(url);
    if (response.statusCode == StatusCode.ok.value) {
      return _jsonToMovies(json.decode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == StatusCode.unauthorized.value) {
      throw ApiKeyInvalidException();
    } else if (response.statusCode == StatusCode.notFound.value) {
      throw NotFoundException();
    } else {
      return throw Exception();
    }
  }

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final moviedbReponse = MovieDto.fromJson(json);

    final List<Movie> movies = moviedbReponse.results
        .where((moviedb) => moviedb.posterPath != '')
        .map((moviedb) => parseMovieApiToDomain(moviedb))
        .toList();
    return movies;
  }
}
