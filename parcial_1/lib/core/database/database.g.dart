// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AuthorDao? _authorDaoInstance;

  BookDao? _bookDaoInstance;

  UserDao? _userDaoInstance;

  UserSessionDao? _userSessionDaoInstance;

  UserFavoriteDao? _userFavoriteDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Author` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `biography` TEXT NOT NULL, `imageUrl` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Book` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `authorId` INTEGER, `releaseYear` INTEGER, `imageUrl` TEXT, `summary` TEXT NOT NULL, `title` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `email` TEXT NOT NULL, `password` TEXT NOT NULL, `username` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UserSession` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `userId` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UserFavorite` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `userId` INTEGER NOT NULL, `bookId` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AuthorDao get authorDao {
    return _authorDaoInstance ??= _$AuthorDao(database, changeListener);
  }

  @override
  BookDao get bookDao {
    return _bookDaoInstance ??= _$BookDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  UserSessionDao get userSessionDao {
    return _userSessionDaoInstance ??=
        _$UserSessionDao(database, changeListener);
  }

  @override
  UserFavoriteDao get userFavoriteDao {
    return _userFavoriteDaoInstance ??=
        _$UserFavoriteDao(database, changeListener);
  }
}

class _$AuthorDao extends AuthorDao {
  _$AuthorDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _authorInsertionAdapter = InsertionAdapter(
            database,
            'Author',
            (Author item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'biography': item.biography,
                  'imageUrl': item.imageUrl
                }),
        _authorUpdateAdapter = UpdateAdapter(
            database,
            'Author',
            ['id'],
            (Author item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'biography': item.biography,
                  'imageUrl': item.imageUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Author> _authorInsertionAdapter;

  final UpdateAdapter<Author> _authorUpdateAdapter;

  @override
  Future<List<Author>> findAllAuthors() async {
    return _queryAdapter.queryList('SELECT * FROM Author',
        mapper: (Map<String, Object?> row) => Author(
            id: row['id'] as int?,
            name: row['name'] as String,
            biography: row['biography'] as String,
            imageUrl: row['imageUrl'] as String?));
  }

  @override
  Future<Author?> findAuthorById(int id) async {
    return _queryAdapter.query('SELECT * FROM Author WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Author(
            id: row['id'] as int?,
            name: row['name'] as String,
            biography: row['biography'] as String,
            imageUrl: row['imageUrl'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> deleteAuthorById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Author WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertAuthor(Author author) async {
    await _authorInsertionAdapter.insert(author, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAuthor(Author author) async {
    await _authorUpdateAdapter.update(author, OnConflictStrategy.abort);
  }
}

class _$BookDao extends BookDao {
  _$BookDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _bookInsertionAdapter = InsertionAdapter(
            database,
            'Book',
            (Book item) => <String, Object?>{
                  'id': item.id,
                  'authorId': item.authorId,
                  'releaseYear': item.releaseYear,
                  'imageUrl': item.imageUrl,
                  'summary': item.summary,
                  'title': item.title
                }),
        _bookUpdateAdapter = UpdateAdapter(
            database,
            'Book',
            ['id'],
            (Book item) => <String, Object?>{
                  'id': item.id,
                  'authorId': item.authorId,
                  'releaseYear': item.releaseYear,
                  'imageUrl': item.imageUrl,
                  'summary': item.summary,
                  'title': item.title
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Book> _bookInsertionAdapter;

  final UpdateAdapter<Book> _bookUpdateAdapter;

  @override
  Future<List<Book>> findAllBooks() async {
    return _queryAdapter.queryList('SELECT * FROM Book',
        mapper: (Map<String, Object?> row) => Book(
            id: row['id'] as int?,
            authorId: row['authorId'] as int?,
            releaseYear: row['releaseYear'] as int?,
            imageUrl: row['imageUrl'] as String?,
            summary: row['summary'] as String,
            title: row['title'] as String));
  }

  @override
  Future<List<Book>> findAllBooksByAuthor(int authorId) async {
    return _queryAdapter.queryList('SELECT * FROM Book WHERE authorId = ?1',
        mapper: (Map<String, Object?> row) => Book(
            id: row['id'] as int?,
            authorId: row['authorId'] as int?,
            releaseYear: row['releaseYear'] as int?,
            imageUrl: row['imageUrl'] as String?,
            summary: row['summary'] as String,
            title: row['title'] as String),
        arguments: [authorId]);
  }

  @override
  Future<Book?> findBookById(int id) async {
    return _queryAdapter.query('SELECT * FROM Book WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Book(
            id: row['id'] as int?,
            authorId: row['authorId'] as int?,
            releaseYear: row['releaseYear'] as int?,
            imageUrl: row['imageUrl'] as String?,
            summary: row['summary'] as String,
            title: row['title'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteBookById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Book WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertBook(Book book) async {
    await _bookInsertionAdapter.insert(book, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateBook(Book book) async {
    await _bookUpdateAdapter.update(book, OnConflictStrategy.replace);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'email': item.email,
                  'password': item.password,
                  'username': item.username
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  @override
  Future<List<User>> findAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            email: row['email'] as String,
            password: row['password'] as String,
            username: row['username'] as String));
  }

  @override
  Future<User?> findUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            email: row['email'] as String,
            password: row['password'] as String,
            username: row['username'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }
}

class _$UserSessionDao extends UserSessionDao {
  _$UserSessionDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userSessionInsertionAdapter = InsertionAdapter(
            database,
            'UserSession',
            (UserSession item) =>
                <String, Object?>{'id': item.id, 'userId': item.userId});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserSession> _userSessionInsertionAdapter;

  @override
  Future<List<UserSession>> findAllUserSessions() async {
    return _queryAdapter.queryList('SELECT * FROM UserSession',
        mapper: (Map<String, Object?> row) =>
            UserSession(id: row['id'] as int?, userId: row['userId'] as int));
  }

  @override
  Future<void> deleteSessionById(int id) async {
    await _queryAdapter.queryNoReturn('DELETE FROM UserSession WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertUserSession(UserSession userSession) async {
    await _userSessionInsertionAdapter.insert(
        userSession, OnConflictStrategy.abort);
  }
}

class _$UserFavoriteDao extends UserFavoriteDao {
  _$UserFavoriteDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userFavoriteInsertionAdapter = InsertionAdapter(
            database,
            'UserFavorite',
            (UserFavorite item) => <String, Object?>{
                  'id': item.id,
                  'userId': item.userId,
                  'bookId': item.bookId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserFavorite> _userFavoriteInsertionAdapter;

  @override
  Future<UserFavorite?> findFavoriteForUser(
    int userId,
    int bookId,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM UserFavorite WHERE userId = ?1 AND bookId = ?2',
        mapper: (Map<String, Object?> row) => UserFavorite(
            id: row['id'] as int?,
            userId: row['userId'] as int,
            bookId: row['bookId'] as int),
        arguments: [userId, bookId]);
  }

  @override
  Future<void> deleteFavorite(
    int userId,
    int bookId,
  ) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM UserFavorite WHERE userId = ?1 AND bookId = ?2',
        arguments: [userId, bookId]);
  }

  @override
  Future<void> insertFavorite(UserFavorite userFavorite) async {
    await _userFavoriteInsertionAdapter.insert(
        userFavorite, OnConflictStrategy.abort);
  }
}
