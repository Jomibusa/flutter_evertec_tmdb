import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:infrastructure/movie/local/dao/movie_dao.dart';
import 'package:infrastructure/movie/local/dao/tracking_dao.dart';
import 'package:infrastructure/movie/local/database.dart';
import 'package:test/test.dart';

void main() {
  AppDatabase? database;
  MovieDao? movieDao;
  TrackingDao? trackingDao;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    movieDao = MovieDao(database!);
    trackingDao = TrackingDao(database!);
  });
  tearDown(() async {
    await database?.close();
  });

  group('Database Tests', () {
    group('Movie database', () {
      test('movies can be created', () async {
        //Arrange
        final id = await movieDao?.insertMovie(
          MovieCompanion(
            title: const Value('Jomibusa Test Movie'),
            backdropPath: const Value(''),
            originalTitle: const Value('Jomibusa movies'),
            overview: const Value(
                'Movie where we can see id the movie was save or not'),
            posterPath: const Value(''),
            releaseDate: Value(DateTime.now()),
            voteAverage: const Value(4.5),
            adult: const Value(false),
            originalLanguage: const Value('en'),
          ),
        );
        //Act
        final movie = await movieDao?.watchMovieWithId(id!).first;

        //Assert
        expect(movie!.title, 'Jomibusa Test Movie');
      });

      test('movie can be update', () async {
        //Arrange
        final id = await movieDao?.insertMovie(
          MovieCompanion(
            title: const Value('Jomibusa Test Movie'),
            backdropPath: const Value(''),
            originalTitle: const Value('Jomibusa movies'),
            overview: const Value(
                'Movie where we can see id the movie was save or not'),
            posterPath: const Value(''),
            releaseDate: Value(DateTime.now()),
            voteAverage: const Value(4.5),
            adult: const Value(false),
            originalLanguage: const Value('en'),
          ),
        );
        final movie = await movieDao?.watchMovieWithId(id!).first;
        final newMovie = MovieData(
          id: movie!.id,
          backdropPath: '',
          originalTitle: '',
          overview: '',
          posterPath: '',
          releaseDate: DateTime.now(),
          title: 'Jomibusa Test dos Movie',
          voteAverage: 4.5,
          originalLanguage: 'en',
          adult: true,
        );

        //Act
        await movieDao?.updateMovie(newMovie);

        final movieTest = await movieDao?.watchMovieWithId(id!).first;

        //Assert
        expect(movieTest!.title, 'Jomibusa Test dos Movie');
      });

      test('movies can be deleted', () async {
        //Arrange
        await movieDao?.insertMovie(
          MovieCompanion(
            title: const Value('Jomibusa Test Movie'),
            backdropPath: const Value(''),
            originalTitle: const Value('Jomibusa movies'),
            overview: const Value(
                'Movie where we can see id the movie was save or not'),
            posterPath: const Value(''),
            releaseDate: Value(DateTime.now()),
            voteAverage: const Value(4.5),
            adult: const Value(false),
            originalLanguage: const Value('en'),
          ),
        );

        //Act
        final movieDelete = await movieDao?.deleteAllMovies();

        //Assert
        expect(movieDelete, 1);
      });
    });

    group('Tracking database', () {
      test('tracking can be created', () async {
        //Arrange
        final id = await trackingDao?.insertTracking(
          const TrackingCompanion(
            date: Value('2023-04-21 07:00:00.000'),
          ),
        );

        //Act
        final tracking = await trackingDao?.watchTrackingWithId(id!).first;

        //Assert
        expect(tracking!.date, '2023-04-21 07:00:00.000');
      });

      test('tracking can be update', () async {
        //Arrange
        final id = await trackingDao?.insertTracking(
          const TrackingCompanion(
            date: Value('2023-04-21 07:00:00.000'),
          ),
        );
        final tracking = await trackingDao?.watchTrackingWithId(id!).first;
        final newTracking =
            TrackingData(id: tracking!.id, date: '2023-04-22 07:00:00.000');

        //Act
        await trackingDao?.updateTracking(newTracking);

        final trackingTest = await trackingDao?.watchTrackingWithId(id!).first;

        //Assert
        expect(trackingTest!.date, '2023-04-22 07:00:00.000');
      });
    });
  });
}
