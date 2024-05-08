import 'package:floor/floor.dart';
import 'package:challenge_3/domain/movie.dart';

@dao
abstract class MovieDao {
  @Query('SELECT * FROM Movie')
  Future<List<Movie>> findAllMovies();

  @Query('SELECT * FROM Movie WHERE id = :id')
  Future<Movie?> findMovieById(int id);

  @Query('SELECT * FROM Movie WHERE title = :title')
  Future<Movie?> findMovieByTitle(String title);

  @insert
  Future<void> insertMovie(Movie movie);
}
