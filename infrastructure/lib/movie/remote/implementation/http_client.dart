import 'package:infrastructure/movie/remote/config_network.dart';
import 'package:injectable/injectable.dart';

class ApiKeyInvalidException implements Exception {}

class NotFoundException implements Exception {}

@injectable
class HttpClient extends ConfigNetwork {
  @override
  String get baseUrl => 'http://api.themoviedb.org/3';
  
  @override
  String get pathMovie => "/movie";
  
  @override
  String get pathUpComing => "/movie/upcoming";
  
  @override
  String get pathSearch => "/search/movie";
}
