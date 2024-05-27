import 'package:floor/floor.dart';
import 'package:parcial_1/domain/author.dart';

@dao
abstract class AuthorDao {
  @Query('SELECT * FROM Author')
  Future<List<Author>> findAllAuthors();

  @Query('SELECT * FROM Author WHERE id = :id')
  Future<Author?> findAuthorById(int id);

  @insert
  Future<void> insertAuthor(Author author);

  @update
  Future<void> updateAuthor(Author author);
}
