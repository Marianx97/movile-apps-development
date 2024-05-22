import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/presentation/screens/book_form.dart';

class EditBookScreen extends StatelessWidget {
  static const name = 'edit_book_screen';
  final int bookId;

  const EditBookScreen({
    super.key,
    required this.bookId,
  });

  void _editBook(BuildContext context, Book updatedBook) {
    books.removeWhere((book) => book.id == updatedBook.id);
    books.add(updatedBook);
    context.go('/book_detail/${updatedBook.id}');
  }

  @override
  Widget build(BuildContext context) {
    final Book book = books.firstWhere((book) => book.id == bookId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Book'),
      ),
      body: BookForm(
        book: book,
        onSave: (updatedBook) => _editBook(context, updatedBook),
      ),
    );
  }
}
