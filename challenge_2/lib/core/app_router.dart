import 'package:challenge_2/core/entities/user.dart';
import 'package:challenge_2/presentation/screens/home_screen.dart';
import 'package:challenge_2/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(user: state.extra as User),
    )
  ],
);
