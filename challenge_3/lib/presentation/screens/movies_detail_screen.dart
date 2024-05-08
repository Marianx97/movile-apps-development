import 'package:flutter/material.dart';
import 'package:challenge_3/domain/movie.dart';
import 'package:challenge_3/datasource/movie_repository.dart';

class MovieDetailScreen extends StatefulWidget {
  static const String name = 'movie_detail_screen';

  final int movieId;
  final MovieRepository movieRepository;

  const MovieDetailScreen({
    super.key,
    required this.movieId,
    required this.movieRepository,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<Movie?> movieRequest;

  @override
  void initState() {
    super.initState();
    movieRequest = widget.movieRepository.getMovieById(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: FutureBuilder(
        future: movieRequest,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator()
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            return _MovieDetailView(movie: snapshot.data!);
          } else {
            return const Text('No movie found');
          }
        },
      ),
    );
  }
}

class _MovieDetailView extends StatelessWidget {
  const _MovieDetailView({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (movie.posterUrl != null) Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterUrl ?? '',
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (movie.posterUrl != null) const SizedBox(height:  20),
          Text(
            movie.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Director: ${movie.director}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'Year: ${movie.year.toString()}',
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
