import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:domain/movie/model/movie.dart';
import 'package:flutter/material.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;
  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return FadeInUp(
      from: random.nextInt(100) + 80,
      delay: Duration(milliseconds: random.nextInt(450) + 0),
      child: GestureDetector(
        onTap: () => null,
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
