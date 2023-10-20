import 'package:domain/movie/model/movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/movie/remote/dto/result_dto.dart';

import 'helper_mixin.dart';

void main() {
  late HelperMixinTest mockClass;
  setUp(() => mockClass = HelperMixinTest());

  test('parse movieTable to domain should be the same', () {
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
    final resultDto = ResultDto(
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

    //Act
    final movieDomain = mockClass.parseMovieApiToDomain(resultDto);

    //Assert
    expect(movieDomain.title, movie.title);
  });
}
