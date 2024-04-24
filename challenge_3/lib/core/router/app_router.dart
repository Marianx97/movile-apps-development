import 'package:go_router/go_router.dart';

import 'package:challenge_3/presentation/screens/login_screen.dart';
import 'package:challenge_3/presentation/screens/movies_detail_screen.dart';
import 'package:challenge_3/presentation/screens/movies_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/movies',
      name: MoviesScreen.name,
      builder: (context, state) => const MoviesScreen(),
    ),
    GoRoute(
      path: '/movie_detail/:movieId',
      name: MovieDetailScreen.name,
      builder: (context, state) => MovieDetailScreen(
        movieId: state.pathParameters['movieId']!,
      ),
    )
  ],
);
