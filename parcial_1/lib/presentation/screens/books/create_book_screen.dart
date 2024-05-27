import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/datasource/repositories/book_repository.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/presentation/screens/books/book_form.dart';
import 'package:parcial_1/presentation/screens/books/books_screen.dart';
import 'package:parcial_1/presentation/widgets/drawer_menu.dart';

class CreateBookScreen extends StatelessWidget {
  static const name = 'create_book_screen';
  final scafoldKey = GlobalKey<ScaffoldState>();
  final BookRepository bookRepository;

  CreateBookScreen({
    super.key,
    required this.bookRepository,
  });

  void _createBook(BuildContext context, Book book) {
    bookRepository.createBook(book);
    context.goNamed(BooksScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(scafoldKey: scafoldKey, selectedScreen: 1),
      appBar: AppBar(
        title: const Text('Create Book'),
      ),
      body: BookForm(
        onSave: (book) => _createBook(context, book),
      ),
    );
  }
}
