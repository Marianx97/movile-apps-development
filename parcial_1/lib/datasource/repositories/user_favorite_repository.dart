import 'package:parcial_1/datasource/daos/user_favorite_dao.dart';
import 'package:parcial_1/domain/user_favorite.dart';
import 'package:parcial_1/main.dart';

class UserFavoriteRepository {
  final UserFavoriteDao _userFavoriteDao = database.userFavoriteDao;

  /// Get favorite by user_id and book_id
  Future<UserFavorite?> getFavoriteForUser(int userId, int bookId) {
    return _userFavoriteDao.findFavoriteForUser(userId, bookId);
  }

  /// Creates favorite for the given params
  Future<void> createFavorite(userFavorite) {
    return _userFavoriteDao.insertFavorite(userFavorite);
  }

  /// Deletes favorite for the given params
  Future<void> deleteFavorite(int userId, int bookId) {
    return _userFavoriteDao.deleteFavorite(userId, bookId);
  }
}
