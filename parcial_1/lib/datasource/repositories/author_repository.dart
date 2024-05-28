import 'package:parcial_1/datasource/daos/author_dao.dart';
import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/main.dart';

class AuthorRepository {
  final AuthorDao _authorDao = database.authorDao;

  /// Get list of authors
  Future<List<Author>> getAuthors() {
    return _authorDao.findAllAuthors();
  }

  /// Get author by ID
  Future<Author?> getAuthorById(int id) {
    return _authorDao.findAuthorById(id);
  }

  /// Creates author with the given params
  Future<void> createAuthor(Author author) {
    return _authorDao.insertAuthor(author);
  }

  /// Updates author with the given params
  Future<void> editAuthor(Author author) {
    return _authorDao.updateAuthor(author);
  }

  /// Deletes author with the given id
  Future<void> deleteAuthor(int authorId) {
    return _authorDao.deleteAuthorById(authorId);
  }
}
