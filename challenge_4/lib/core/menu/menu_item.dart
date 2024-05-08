import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final String link;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.link,
  });
}

const List<MenuItem> menuItems = [
  MenuItem(
    title: 'Buttons',
    subtitle: 'Different types of buttons',
    icon: Icons.smart_button_outlined,
    link: '/buttons',
  ),
  MenuItem(
    title: 'Controls',
    subtitle: 'Different types of controls',
    icon: Icons.smart_button_outlined,
    link: '/controls',
  ),
  MenuItem(
    title: 'Notifications',
    subtitle: 'Different types of notifications',
    icon: Icons.notifications,
    link: '/notifications',
  ),
  MenuItem(
    title: 'Cards',
    subtitle: 'Different types of cards',
    icon: Icons.credit_card,
    link: '/cards',
  ),
  // MenuItem(
  //   title: 'Dialogs',
  //   subtitle: 'Different types of dialogs',
  //   icon: Icons.message_outlined,
  //   link: '/dialogs',
  // ),
];
