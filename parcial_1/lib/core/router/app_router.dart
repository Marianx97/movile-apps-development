import 'package:go_router/go_router.dart';
import 'package:parcial_1/presentation/screens/login_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    )
  ],
);
