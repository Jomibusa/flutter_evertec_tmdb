import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:infrastructure/movie/remote/implementation/http_client.dart';
import 'package:infrastructure/movie/remote/implementation/up_coming_client.dart';

void main() {
  group('UpComing response is Success', () {
    test('UpComing response is correct', () async {
      //Arrange
      final provider =
          _getProvider('test/movie/remote/upcoming_movies.json', 200);
      //Act
      final movies = await provider.getUpComingMovieList();

      //Assert
      expect(movies.length, 20);
      expect((movies[0]).title, 'Suicide Squad');
      expect((movies[1]).title, 'Jason Bourne');
    });

    test('UpComing response empty list', () async {
      //Arrange
      final provider =
          _getProvider('test/movie/remote/upcoming_empty_movies.json', 200);
      //Act
      final movies = await provider.getUpComingMovieList();

      //Assert
      expect(movies.length, 0);
    });
  });

  group('UpComing reponse is incorrect', () {
    test('Invalid Api key exception is thrown correctly', () async {
      //Arrange
      //Act
      final provider =
          _getProvider('test/movie/remote/api_key_invalid.json', 401);

      //Assert
      expect(
        provider.getUpComingMovieList(),
        throwsA(predicate((exception) => exception is ApiKeyInvalidException)),
      );
    });

    test('Request not found is thrown correctly', () async {
      //Arrange
      //Act
      final provider =
          _getProvider('test/movie/remote/request_not_found.json', 404);

      //Assert
      expect(
        provider.getUpComingMovieList(),
        throwsA(predicate((exception) => exception is NotFoundException)),
      );
    });
  });
}

final headers = {
  HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
};

UpComingClient _getProvider(String filePath, int statusCode) => UpComingClient(
      client: _getMockProvider(filePath, statusCode),
      configNetwork: HttpClient(),
    );

MockClient _getMockProvider(String filePath, int statusCode) => MockClient(
      (_) async => Response(
        await File(filePath).readAsString(),
        statusCode,
        headers: headers,
      ),
    );
