import 'package:challenge_3/datasource/movie_dao.dart';
import 'package:challenge_3/datasource/movie_repository.dart';
import 'package:challenge_3/domain/movie.dart';
import 'package:challenge_3/main.dart';

class LocalMovieRepository implements MovieRepository {
  final MovieDao _movieDao = database.movieDao;

  @override
  Future<List<Movie>> getMovies() {
    return _movieDao.findAllMovies();
  }

  @override
  Future<Movie?> getMovieById(int id) {
    return _movieDao.findMovieById(id);
  }
}
