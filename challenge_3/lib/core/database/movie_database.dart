import 'dart:async';
import 'package:floor/floor.dart';
import 'package:challenge_3/datasource/movie_dao.dart';
import 'package:challenge_3/domain/movie.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'movie_database.g.dart';

@Database(version: 1, entities: [Movie])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}
