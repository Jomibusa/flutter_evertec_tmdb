// ignore_for_file: lines_longer_than_80_chars

import 'package:domain/movie/exception/empty_exception.dart';
import 'package:domain/movie/model/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final movie = Movie(
    backdropPath: '/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg',
    id: 297761,
    originalTitle: 'Suicide Squad',
    overview:
        'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
    posterPath: '/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg',
    releaseDate: DateTime.now(),
    title: 'Suicide Squad',
    voteAverage: 4.5,
    originalLanguage: 'en',
    adult: true,
  );

  test('movie can be create successful', () {
    //Arrange
    //Act
    final movieSuccess = movie.copyWith();
    //Assert
    expect(movieSuccess, isNotNull);
  });

  test('movie vote average is divided', () {
    //Arrange
    //Act
    final movieVoteDivided = movie.copyWith(voteAverage: 10);
    //Assert
    expect(movieVoteDivided.voteAverage, 5);
  });

  group('movie fields throw empty exception', () {
    test('movie title empty throw empty exception', () {
      //Arrange
      //Act
      //Assert
      expect(
        () => movie.copyWith(title: ''),
        throwsA(isInstanceOf<EmptyException>()),
      );
    });

    test('movie original title empty throw empty exception', () {
      //Arrange
      //Act
      //Assert
      expect(
        () => movie.copyWith(originalTitle: ''),
        throwsA(isInstanceOf<EmptyException>()),
      );
    });

    test('movie poster path empty throw empty exception', () {
      //Arrange
      //Act
      //Assert
      expect(
        () => movie.copyWith(posterPath: ''),
        throwsA(isInstanceOf<EmptyException>()),
      );
    });

    test('movie original lñanguage empty throw empty exception', () {
      //Arrange
      //Act
      //Assert
      expect(
        () => movie.copyWith(originalLanguage: ''),
        throwsA(isInstanceOf<EmptyException>()),
      );
    });
  });
}
