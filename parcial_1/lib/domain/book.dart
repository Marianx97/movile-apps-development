import 'package:floor/floor.dart';

@entity
class Book {

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int? authorId;
  final int? releaseYear;
  final String? imageUrl;
  final String summary;
  final String title;

  Book({
    this.id,
    this.authorId,
    this.releaseYear,
    this.imageUrl,
    required this.summary,
    required this.title,
  });  
}
