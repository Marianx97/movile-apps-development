import 'package:challenge_3/presentation/screens/movies_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:challenge_3/datasource/movie_repository.dart';
import 'package:challenge_3/domain/movie.dart';
import 'package:challenge_3/presentation/screens/login_screen.dart';

class MoviesScreen extends StatefulWidget {
  static const String name = 'movies_screen';

  final MovieRepository movieRepository;

  const MoviesScreen({
    super.key,
    required this.movieRepository,
  });

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late Future<List<Movie>> movieRequest;

  @override
  void initState() {
    super.initState();
    movieRequest = widget.movieRepository.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: FutureBuilder(
        future: movieRequest,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              return _MoviesView(movieList: snapshot.data!);
            } else {
              return Text(snapshot.error.toString());
            }
          }
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.goNamed(LoginScreen.name);
        },
        label: const Text('Logout'),
        icon: const Icon(Icons.logout),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class _MoviesView extends StatelessWidget {
  const _MoviesView({super.key, required this.movieList});

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        final movie = movieList[index];
        return _MovieItemView(
          movie: movie,
        );
      },
    );
  }
}

class _MovieItemView extends StatelessWidget {
  final Movie movie;

  const _MovieItemView({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(movie.title),
        subtitle: Text(movie.director),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            movie.posterUrl ?? '',
            fit: BoxFit.cover,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => _goToMovieDetails(context, movie),
      ),
    );
  }
}

void _goToMovieDetails(BuildContext context, Movie movie) {
  context.push('/movie_detail/${movie.id}');
}
