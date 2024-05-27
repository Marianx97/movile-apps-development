import 'package:floor/floor.dart';

@entity
class User {

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String email;
  final String password;
  final String username;

  User({
    this.id,
    required this.email,
    required this.password,
    required this.username,
  });
}
