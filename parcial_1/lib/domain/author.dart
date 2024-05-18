import 'package:floor/floor.dart';

@entity
class Author {
  
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
  final String biography;
  final String? imageUrl;

  Author({
    required this.id,
    required this.name,
    required this.biography,
    this.imageUrl,
  });
}
