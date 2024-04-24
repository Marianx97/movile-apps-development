import 'package:challenge_3/datasource/movie_datasource.dart';
import 'package:challenge_3/domain/movie.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  static const String name = 'movie_detail_screen';

  final String movieId;
  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Movie Detail'),
      ),
      body: _MovieDetailView(
        movieId: movieId,
      ),
    );
  }
}

class _MovieDetailView extends StatelessWidget {
  final String movieId;

  const _MovieDetailView({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    final Movie movie = movies.firstWhere((movie) => movie.id == movieId);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
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
          const SizedBox(height:  20),
          Text(
            movie.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            movie.director,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            movie.year.toString(),
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
