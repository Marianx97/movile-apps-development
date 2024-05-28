import 'package:parcial_1/datasource/daos/book_dao.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/main.dart';

class BookRepository {
  final BookDao _bookDao = database.bookDao;

  /// Get list of books
  Future<List<Book>> getBooks() {
    return _bookDao.findAllBooks();
  }

  /// Get all the books from an author
  Future<List<Book>> getBooksByAuthor(int authorId) {
    return _bookDao.findAllBooksByAuthor(authorId);
  }

  /// Get book by ID
  Future<Book?> getBookById(int id) {
    return _bookDao.findBookById(id);
  }

  /// Creates book with the given params
  Future<void> createBook(Book book) {
    return _bookDao.insertBook(book);
  }

  /// Updates author with the given params
  Future<void> editBook(Book book) {
    return _bookDao.updateBook(book);
  }

  /// Deletes book with the given id
  Future<void> deleteBook(int bookId) {
    return _bookDao.deleteBookById(bookId);
  }
}
