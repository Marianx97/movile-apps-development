import 'package:floor/floor.dart';

@entity
class UserSession {

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int userId;

  UserSession({
    this.id,
    required this.userId,
  });
}
