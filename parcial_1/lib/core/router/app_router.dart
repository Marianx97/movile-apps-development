import 'package:go_router/go_router.dart';
import 'package:parcial_1/presentation/screens/author_details_screen.dart';
import 'package:parcial_1/presentation/screens/authors_screen.dart';
import 'package:parcial_1/presentation/screens/book_details_screen.dart';
import 'package:parcial_1/presentation/screens/books_screen.dart';
import 'package:parcial_1/presentation/screens/create_book_screen.dart';
import 'package:parcial_1/presentation/screens/edit_book_screen.dart';
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
      builder: (context, state) => const BooksScreen(),
    ),
    GoRoute(
      path: '/book_detail/:bookId',
      name: BookDetailsScreen.name,
      builder: (context, state) {
        final bookId = state.pathParameters['bookId'];
        return BookDetailsScreen(
          bookId: int.tryParse(bookId ?? '') ?? -1,
        );
      },
    ),
    GoRoute(
      path: '/books/add',
      name: CreateBookScreen.name,
      builder:(context, state) => const CreateBookScreen(),
    ),
    GoRoute(
      path: '/books/edit/:bookId',
      name: EditBookScreen.name,
      builder: (context, state) {
        final bookId = state.pathParameters['bookId'];
        return EditBookScreen(
          bookId: int.tryParse(bookId ?? '') ?? -1,
        );
      },
    ),
    GoRoute(
      path: '/authors',
      name: AuthorsScreen.name,
      builder: (context, state) => const AuthorsScreen(),
    ),
    GoRoute(
      path: '/author_detail/:authorId',
      name: AuthorDetailsScreen.name,
      builder: (context, state) {
        final authorId = state.pathParameters['authorId'];
        return AuthorDetailsScreen(
          authorId: int.tryParse(authorId ?? '') ?? -1,
        );
      },
    ),
  ],
);
