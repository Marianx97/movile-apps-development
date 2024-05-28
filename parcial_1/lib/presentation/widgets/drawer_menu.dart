import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/core/menu/menu_item.dart';
import 'package:parcial_1/datasource/repositories/user_session_repository.dart';
import 'package:parcial_1/domain/user_session.dart';
import 'package:parcial_1/presentation/screens/login_screen.dart';

class DrawerMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scafoldKey;
  final int selectedScreen;

  const DrawerMenu({
    super.key,
    required this.scafoldKey,
    required this.selectedScreen,
  });

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  late Future<List<UserSession>> userSessionsRequest;

  @override
  void initState() {
    userSessionsRequest = UserSessionRepository().getUserSessions();
    super.initState();
  }

  void _logout(BuildContext context, UserSession session) {
    UserSessionRepository().deleteUserSession(session.id!);
    context.goNamed(LoginScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: NavigationDrawer(
        selectedIndex: widget.selectedScreen,
        onDestinationSelected: (value) {
          context.go(menuItems[value].link);
          widget.scafoldKey.currentState?.closeDrawer();
        },
        children: [
          const SizedBox(height: 30),
          ...menuItems.map((item) {
            return NavigationDrawerDestination(
              icon: Icon(item.icon),
              label: Text(item.title)
            );
          }),
          const SizedBox(height: 30),
          FutureBuilder(
            future: userSessionsRequest,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasData) {
                  UserSession session = snapshot.data!.first;

                  return ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    tileColor: Colors.red.shade300,
                    onTap: () => _logout(context, session),
                  );
                } else {
                  return const Text('Something Failed');
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}