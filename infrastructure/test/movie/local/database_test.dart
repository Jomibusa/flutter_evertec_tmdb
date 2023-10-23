import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:infrastructure/movie/local/dao/movie_dao.dart';
import 'package:infrastructure/movie/local/database.dart';
import 'package:test/test.dart';

void main() {
  AppDatabase? database;
  MovieDao? movieDao;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    movieDao = MovieDao(database!);
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
            genres: const Value('Comedia, Acción')
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
            genres: const Value('Comedia, Acción')
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
          genres: 'Comedia, Acción'
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
            genres: const Value('Comedia, Acción')
          ),
        );

        //Act
        final movieDelete = await movieDao?.deleteAllMovies();

        //Assert
        expect(movieDelete, 1);
      });
    });
  });
}
