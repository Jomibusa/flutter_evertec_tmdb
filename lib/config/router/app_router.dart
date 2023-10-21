import 'package:flutter_evertec_tmdb/presentation/home/screens/home_screen.dart';
import 'package:flutter_evertec_tmdb/presentation/movie/screens/movie_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: MovieHomeScreen.name,
      builder: (context, state) {
        return const MovieHomeScreen();
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieID = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(
              movieID: movieID,
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home',
    )
  ],
);
