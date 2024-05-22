import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/presentation/screens/book_form.dart';
import 'package:parcial_1/presentation/screens/books_screen.dart';

class CreateBookScreen extends StatelessWidget {
  static const name = 'create_book_screen';
  const CreateBookScreen({super.key});

  void _createBook(BuildContext context, Book book) {
    books.add(book);
    context.goNamed(BooksScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Book'),
      ),
      body: BookForm(
        onSave: (book) => _createBook(context, book),
      ),
    );
  }
}
