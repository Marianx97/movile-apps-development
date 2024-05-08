import 'package:floor/floor.dart';

@entity
class Movie {
  @PrimaryKey(autoGenerate: true) 
  final int id;
  final String title;
  final String director;
  final int year;
  final String? posterUrl;

  Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.year,
    this.posterUrl,
  });
}
