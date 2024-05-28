import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/datasource/repositories/author_repository.dart';
import 'package:parcial_1/datasource/repositories/book_repository.dart';
import 'package:parcial_1/presentation/screens/authors/authors_screen.dart';
import 'package:parcial_1/presentation/screens/books/books_screen.dart';

class DeleteButton extends StatelessWidget {
  final String elementType;
  final String elementId;

  const DeleteButton({
    super.key,
    required this.elementType,
    required this.elementId,
  });

  void _callDelete(BuildContext context, String type, String id) {
    switch (type) {
      case 'Book':
        BookRepository().deleteBook(int.tryParse(id)!);
        context.goNamed(BooksScreen.name);
        break;
      case 'Author':
        AuthorRepository().deleteAuthor(int.tryParse(id)!);
        context.goNamed(AuthorsScreen.name);
        break;
    }
  }

  void _confirmDelete(BuildContext context, String type, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Are you sure?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: FilledButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Cancel'),
                    ),
                    FilledButton(
                      onPressed: () => _callDelete(context, type, id),
                      child: const Text('Delete'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () => _confirmDelete(context, elementType, elementId),
    );
  }
}
