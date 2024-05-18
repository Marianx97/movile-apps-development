import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:parcial_1/datasource/daos/book_dao.dart';
import 'package:parcial_1/datasource/daos/user_dao.dart';

import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/domain/user.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Book, User])
abstract class AppDatabase extends FloorDatabase {
  BookDao get bookDao;
  UserDao get userDao;
}
