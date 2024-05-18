import 'package:parcial_1/datasource/daos/user_dao.dart';
import 'package:parcial_1/domain/user.dart';
import 'package:parcial_1/main.dart';

class UserRepository {
  final UserDao _userDao = database.userDao;

  /// Get user by ID
  Future<User?> getUserById(int id) {
    return _userDao.findUserById(id);
  }

  /// Creates user with the given params
  Future<void> createUser(User user) {
    return _userDao.insertUser(user);
  }
}
