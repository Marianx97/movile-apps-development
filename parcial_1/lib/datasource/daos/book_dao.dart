import 'package:floor/floor.dart';
import 'package:parcial_1/domain/book.dart';

@dao
abstract class BookDao {
  @Query('SELECT * FROM Book')
  Future<List<Book>> findAllBooks();

  @Query('SELECT * FROM Book WHERE author_id = :authorId')
  Future<List<Book>> findAllBooksByAuthor(int authorId);

  @Query('SELECT * FROM Book WHERE id = :id')
  Future<Book?> findBookById(int id);

  @insert
  Future<void> insertBook(Book book);
}