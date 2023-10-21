import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:domain/movie/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_evertec_tmdb/presentation/movie/provider/movie_local_save_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends ConsumerWidget {
  final Movie movie;
  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final random = Random();
    return FadeInUp(
      from: random.nextInt(100) + 80,
      delay: Duration(milliseconds: random.nextInt(450) + 0),
      child: GestureDetector(
        onTap: () => {
          ref.read(movieLocalSaveProvider.notifier).saveMovie(movie),
          context.push('/home/movie/${movie.id}')
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            height: 180,
            fit: BoxFit.cover,
            placeholder: const NetworkImage(
                'https://images.vexels.com/media/users/3/131259/isolated/lists/a06c38cabdcb7a6761c740cfe16eb22b-loading-cursor-icon.png'),
            image: NetworkImage(movie.posterPath),
          ),
        ),
      ),
    );
  }
}
