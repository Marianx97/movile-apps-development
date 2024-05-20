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

// TODO: delete this and implement repository method
List<User> users = [
  User(id: 1, email: 'alberto@fakemail.com', password: 'pass1', username: 'Albert'),
  User(id: 2, email: 'barbara@fakemail.com', password: 'pass2', username: 'Barbie'),
];
