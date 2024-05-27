import 'package:go_router/go_router.dart';
import 'package:parcial_1/datasource/repositories/author_repository.dart';
import 'package:parcial_1/datasource/repositories/book_repository.dart';
import 'package:parcial_1/presentation/screens/authors/author_details_screen.dart';
import 'package:parcial_1/presentation/screens/authors/authors_screen.dart';
import 'package:parcial_1/presentation/screens/authors/create_author_screen.dart';
import 'package:parcial_1/presentation/screens/authors/edit_author_screen.dart';
import 'package:parcial_1/presentation/screens/books/book_details_screen.dart';
import 'package:parcial_1/presentation/screens/books/books_screen.dart';
import 'package:parcial_1/presentation/screens/books/create_book_screen.dart';
import 'package:parcial_1/presentation/screens/books/edit_book_screen.dart';
import 'package:parcial_1/presentation/screens/login_screen.dart';
import 'package:parcial_1/presentation/screens/signup_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: SignUpScreen.name,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/books',
      name: BooksScreen.name,
      builder: (context, state) => BooksScreen(bookRepository: BookRepository()),
    ),
    GoRoute(
      path: '/book_detail/:bookId',
      name: BookDetailsScreen.name,
      builder: (context, state) {
        final bookId = state.pathParameters['bookId'];
        return BookDetailsScreen(
          bookId: int.tryParse(bookId ?? '') ?? -1,
          bookRepository: BookRepository(),
        );
      },
    ),
    GoRoute(
      path: '/books/add',
      name: CreateBookScreen.name,
      builder:(context, state) => CreateBookScreen(bookRepository: BookRepository()),
    ),
    GoRoute(
      path: '/books/edit/:bookId',
      name: EditBookScreen.name,
      builder: (context, state) {
        final bookId = state.pathParameters['bookId'];
        return EditBookScreen(
          bookId: int.tryParse(bookId ?? '') ?? -1,
          bookRepository: BookRepository(),
        );
      },
    ),
    GoRoute(
      path: '/authors',
      name: AuthorsScreen.name,
      builder: (context, state) => AuthorsScreen(authorRepository: AuthorRepository()),
    ),
    GoRoute(
      path: '/author_detail/:authorId',
      name: AuthorDetailsScreen.name,
      builder: (context, state) {
        final authorId = state.pathParameters['authorId'];
        return AuthorDetailsScreen(
          authorId: int.tryParse(authorId ?? '') ?? -1,
          authorRepository: AuthorRepository(),
        );
      },
    ),
    GoRoute(
      path: '/authors/add',
      name: CreateAuthorScreen.name,
      builder: (context, state) => CreateAuthorScreen(authorRepository: AuthorRepository()),
    ),
    GoRoute(
      path: '/authors/edit/:authorId',
      name: EditAuthorScreen.name,
      builder: (context, state) {
        final authorId = state.pathParameters['authorId'];
        return EditAuthorScreen(
          authorId: int.tryParse(authorId ?? '') ?? -1,
          authorRepository: AuthorRepository(),
        );
      },
    )
  ],
);
