import 'package:floor/floor.dart';
import 'package:parcial_1/domain/user_session.dart';

@dao
abstract class UserSessionDao {
  @Query('SELECT * FROM UserSession')
  Future<List<UserSession>> findAllUserSessions();

  @insert
  Future<void> insertUserSession(UserSession userSession);

  @Query('DELETE FROM UserSession WHERE id = :id')
  Future<void> deleteSessionById(int id);
}
