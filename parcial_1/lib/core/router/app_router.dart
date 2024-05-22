import 'package:go_router/go_router.dart';
import 'package:parcial_1/presentation/screens/book_details_screen.dart';
import 'package:parcial_1/presentation/screens/books_screen.dart';
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
    )
  ],
);
