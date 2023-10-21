import 'package:flutter/material.dart';
import 'package:flutter_evertec_tmdb/presentation/home/providers/movie_providers.dart';
import 'package:flutter_evertec_tmdb/presentation/home/widgets/custom_appbar.dart';
import 'package:flutter_evertec_tmdb/presentation/home/widgets/movie_masonry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieHomeScreen extends ConsumerStatefulWidget {
  static const name = 'home_screen';

  const MovieHomeScreen({super.key});

  @override
  MovieHomeScreenState createState() => MovieHomeScreenState();
}

class MovieHomeScreenState extends ConsumerState<MovieHomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final upComingMovies = ref.watch(upComingMoviesProvider);

    if (upComingMovies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: MovieMasonry(
          loadNextPage: () =>
              ref.read(upComingMoviesProvider.notifier).loadNextPage(),
          movies: upComingMovies),
    );
  }
}
