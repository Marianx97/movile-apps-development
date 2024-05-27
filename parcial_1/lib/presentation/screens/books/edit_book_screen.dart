import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/datasource/repositories/book_repository.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/presentation/screens/books/book_form.dart';

class EditBookScreen extends StatefulWidget {
  static const name = 'edit_book_screen';
  final int bookId;
  final BookRepository bookRepository;

  const EditBookScreen({
    super.key,
    required this.bookId,
    required this.bookRepository,
  });

  @override
  State<EditBookScreen> createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  late Future<Book?> bookRequest;

  void _editBook(BuildContext context, Book updatedBook) {
    widget.bookRepository.editBook(updatedBook);
    context.go('/book_detail/${updatedBook.id}');
  }

  @override
  void initState() {
    super.initState();
    bookRequest = widget.bookRepository.getBookById(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Book'),
      ),
      body: FutureBuilder(
        future: bookRequest,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return BookForm(
              book: snapshot.data!,
              onSave: (updatedBook) => _editBook(context, updatedBook),
            );
          }
        }),
      ),
    );
  }
}
