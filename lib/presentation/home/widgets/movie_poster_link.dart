import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:domain/movie/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_evertec_tmdb/config/utils/human_formats.dart';
import 'package:flutter_evertec_tmdb/presentation/movie/provider/movie_local_save_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends ConsumerWidget {
  final Movie movie;
  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final random = Random();
    return FadeInUp(
      from: random.nextInt(100) + 80,
      delay: Duration(milliseconds: random.nextInt(450) + 0),
      child: GestureDetector(
        onTap: () => {
          ref.read(movieLocalSaveProvider.notifier).saveMovie(movie),
          context.push('/home/movie/${movie.id}')
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                height: 180,
                fit: BoxFit.cover,
                placeholder: const NetworkImage(
                    'https://images.vexels.com/media/users/3/131259/isolated/lists/a06c38cabdcb7a6761c740cfe16eb22b-loading-cursor-icon.png'),
                image: NetworkImage(movie.posterPath),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //* Title
            SizedBox(
              child: Text(
                movie.title,
                maxLines: 2,
                style: textStyles.bodySmall,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //* Title
            SizedBox(
              child: Container(
                color: Colors.white30,
                child: Text(
                  HumanFormats.shortDate(movie.releaseDate),
                  maxLines: 2,
                  style: textStyles.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
