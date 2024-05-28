import 'package:floor/floor.dart';

@entity
class UserFavorite {

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int userId;
  final int bookId;

  UserFavorite({
    this.id,
    required this.userId,
    required this.bookId,
  });
}
