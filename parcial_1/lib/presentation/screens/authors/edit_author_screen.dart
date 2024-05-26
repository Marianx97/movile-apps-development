import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/presentation/screens/authors/author_form.dart';

class EditAuthorScreen extends StatelessWidget {
  static const name = 'edit_author_screen';
  final int authorId;

  const EditAuthorScreen({
    super.key,
    required this.authorId,
  });

  void _editAuthor(BuildContext context, Author updatedAuthor) {
    authors.removeWhere((author) => author.id == updatedAuthor.id);
    authors.add(updatedAuthor);
    context.go('/author_detail/${updatedAuthor.id}');
  }

  @override
  Widget build(BuildContext context) {
    final Author author = authors.firstWhere((author) => author.id == authorId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Author'),
      ),
      body: AuthorForm(
        author: author,
        onSave: (updatedAuthor) => _editAuthor(context, updatedAuthor),
      ),
    );
  }
}
