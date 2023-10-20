import 'package:infrastructure/movie/remote/config_network.dart';
import 'package:injectable/injectable.dart';

class ApiKeyInvalidException implements Exception {}

class NotFoundException implements Exception {}

@Injectable(as: ConfigNetwork, env: [Environment.prod, Environment.dev])
class HttpClient extends ConfigNetwork {
  @override
  String get baseUrl => 'http://api.themoviedb.org/3';
  @override
  String get path => '/movie/upcoming';
}
