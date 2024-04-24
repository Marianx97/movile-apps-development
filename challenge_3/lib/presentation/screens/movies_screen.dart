import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_3/datasource/movie_datasource.dart';
import 'package:challenge_3/domain/movie.dart';
import 'package:challenge_3/presentation/screens/login_screen.dart';

class MoviesScreen extends StatelessWidget {
  static const String name = 'movies_screen';
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: const _MoviesView(),
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
  const _MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
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
        onTap: () {
          context.push('/movie_detail/${movie.id}');
        },
      ),
    );
  }
}
