import 'package:floor/floor.dart';
import 'package:parcial_1/domain/user_favorite.dart';

@dao
abstract class UserFavoriteDao {
  @Query('SELECT * FROM UserFavorite WHERE userId = :userId AND bookId = :bookId')
  Future<UserFavorite?> findFavoriteForUser(int userId, int bookId);

  @insert
  Future<void> insertFavorite(UserFavorite userFavorite);

  @Query('DELETE FROM UserFavorite WHERE userId = :userId AND bookId = :bookId')
  Future<void> deleteFavorite(int userId, int bookId);
}
