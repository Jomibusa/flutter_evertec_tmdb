enum GenresMovies {
  action(28, 'Acción'),
  adventure(12, 'Aventura'),
  animation(16, 'Animación'),
  comedy(35, 'Comedia'),
  crime(80, 'Crimen'),
  documentary(99, 'Documental'),
  drama(18, 'Drama'),
  family(10751, 'Familiar'),
  fantasy(14, 'Fantasía'),
  history(36, 'Historia'),
  horror(27, 'Horror'),
  music(10402, 'Música'),
  mystery(9648, 'Misterio'),
  romance(10749, 'Romántico'),
  scienceFiction(878, 'Ciencia Ficción'),
  tvMovie(10770, 'Película de TV'),
  thriller(53, 'Suspenso'),
  war(10752, 'Guerra'),
  westerm(37, 'Western');

  const GenresMovies(this.code, this.description);
  final int code;
  final String description;

  @override
  String toString() => description;

  static GenresMovies getByCode(int code) {
    return GenresMovies.values.firstWhere((x) => x.code == code);
  }
}
