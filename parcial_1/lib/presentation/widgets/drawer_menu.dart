import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/core/menu/menu_item.dart';

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
          })
        ],
      ),
    );
  }
}