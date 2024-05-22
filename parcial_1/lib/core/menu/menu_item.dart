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
    title: 'Books',
    subtitle: 'List of books in the database',
    icon: Icons.book,
    link: '/books'
  ),
  MenuItem(
    title: 'Authors',
    subtitle: 'List of authors in the database',
    icon: Icons.person,
    link: '/authors'
  ),
  MenuItem(
    title: 'Favorites',
    subtitle: 'List of books marked as favorite',
    icon: Icons.star_border_purple500_outlined,
    link: '/favorites'
  ),
];
