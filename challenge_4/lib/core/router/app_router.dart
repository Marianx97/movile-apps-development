import 'package:challenge_4/presentation/screens/buttons_screen.dart';
import 'package:challenge_4/presentation/screens/cards_screen.dart';
import 'package:challenge_4/presentation/screens/controls_screen.dart';
// import 'package:challenge_4/presentation/screens/dialogs_screen.dart';
import 'package:challenge_4/presentation/screens/home_screen.dart';
import 'package:challenge_4/presentation/screens/notification_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/controls',
      name: ControlsScreen.name,
      builder: (context, state) => const ControlsScreen(),
    ),
    GoRoute(
      path: '/notifications',
      name: NotificationsScreen.name,
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    )
    // GoRoute(
    //   path: '/dialogs',
    //   name: DialogsScreen.name,
    //   builder: (context, state) => DialogsScreen(),
    // ),
  ],
);
