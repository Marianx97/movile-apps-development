import 'package:parcial_1/datasource/daos/user_session_dao.dart';
import 'package:parcial_1/domain/user_session.dart';
import 'package:parcial_1/main.dart';

class UserSessionRepository {
  final UserSessionDao _userSessionDao = database.userSessionDao;

  /// Get all user sessions
  Future<List<UserSession>> getUserSessions() {
    return _userSessionDao.findAllUserSessions();
  }

  /// Creates a user session with the given params
  Future<void> createUserSession(UserSession userSession) {
    return _userSessionDao.insertUserSession(userSession);
  }

  /// Deletes user session for the given id
  Future<void> deleteUserSession(int userSessionId) {
    return _userSessionDao.deleteSessionById(userSessionId);
  }
}
