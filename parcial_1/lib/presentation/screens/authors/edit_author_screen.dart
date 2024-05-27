import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/datasource/repositories/author_repository.dart';
import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/presentation/screens/authors/author_form.dart';

class EditAuthorScreen extends StatefulWidget {
  static const name = 'edit_author_screen';
  final int authorId;
  final AuthorRepository authorRepository;

  const EditAuthorScreen({
    super.key,
    required this.authorId,
    required this.authorRepository,
  });

  @override
  State<EditAuthorScreen> createState() => _EditAuthorScreenState();
}

class _EditAuthorScreenState extends State<EditAuthorScreen> {
  late Future<Author?> authorRequest;

  void _editAuthor(BuildContext context, Author updatedAuthor) {
    widget.authorRepository.editAuthor(updatedAuthor);
    context.go('/author_detail/${updatedAuthor.id}');
  }

  @override
  void initState() {
    super.initState();
    authorRequest = widget.authorRepository.getAuthorById(widget.authorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Author'),
      ),
      body: FutureBuilder(
        future: authorRequest,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return AuthorForm(
              author: snapshot.data!,
              onSave: (updatedAuthor) => _editAuthor(context, updatedAuthor),
            );
          }
        }),
      ),
    );
  }
}
