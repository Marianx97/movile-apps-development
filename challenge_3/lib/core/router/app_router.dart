import 'package:challenge_3/datasource/fake_movie_repository.dart';
import 'package:challenge_3/datasource/local_movie_repository.dart';
import 'package:challenge_3/datasource/movie_repository.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_3/presentation/screens/login_screen.dart';
import 'package:challenge_3/presentation/screens/movies_detail_screen.dart';
import 'package:challenge_3/presentation/screens/movies_screen.dart';

const String _repoEnv = 'LOCAL';

final MovieRepository repository = _repoEnv == 'LOCAL'
  ? LocalMovieRepository()
  : FakeMovieRepository();

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
      builder: (context, state) => MoviesScreen(
        movieRepository: repository,
      ),
    ),
    GoRoute(
      path: '/movie_detail/:movieId',
      name: MovieDetailScreen.name,
      builder: (context, state) {
        final movieId = state.pathParameters['movieId'];
        return MovieDetailScreen(
          movieId: int.tryParse(movieId ?? '') ?? -1,
          movieRepository: repository,
        );
      },
    ),
  ],
);
