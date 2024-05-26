import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String link;

  const MenuItem({
    required this.title,
    required this.icon,
    required this.link,
  });
}

const List<MenuItem> menuItems = [
  MenuItem(
    title: 'Books',
    icon: Icons.menu_book_rounded,
    link: '/books'
  ),
  MenuItem(
    title: 'New Book',
    icon: Icons.add,
    link: '/books/add',
  ),
  MenuItem(
    title: 'Authors',
    icon: Icons.person,
    link: '/authors'
  ),
  MenuItem(
    title: 'New Author',
    icon: Icons.person_add_alt_1,
    link: '/authors/add',
  )
  /// TODO:
  /// - Uncomment when page is ready
  // MenuItem(
  //   title: 'Favorites',
  //   icon: Icons.star_border_purple500_outlined,
  //   link: '/favorites'
  // ),
];
