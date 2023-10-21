// ignore_for_file: lines_longer_than_80_chars

import 'package:domain/movie/model/movie.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/movie/local/database.dart';

import 'helper_mixin.dart';

void main() {
  late HelperMixinTest mockClass;
  setUp(() => mockClass = HelperMixinTest());

  test('parse movie to infra should be the same', () {
    //Arrange
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
    final movieCompanion = MovieCompanion(
      backdropPath: const Value('/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg'),
      originalTitle: const Value('Suicide Squad'),
      overview: const Value(
        'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
      ),
      posterPath: const Value('/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg'),
      releaseDate: Value(DateTime.now()),
      title: const Value('Suicide Squad'),
    );

    //Act
    final movieDB = mockClass.parseMovieDomainToDB(movie);

    //Assert
    expect(movieDB.title, movieCompanion.title);
  });
}
