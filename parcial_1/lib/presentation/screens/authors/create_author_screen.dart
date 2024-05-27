import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/datasource/repositories/author_repository.dart';
import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/presentation/screens/authors/author_form.dart';
import 'package:parcial_1/presentation/screens/authors/authors_screen.dart';
import 'package:parcial_1/presentation/widgets/drawer_menu.dart';

class CreateAuthorScreen extends StatelessWidget {
  static const name = 'create_author_screen';
  final scafoldKey = GlobalKey<ScaffoldState>();
  final AuthorRepository authorRepository;

  CreateAuthorScreen({
    super.key,
    required this.authorRepository,
  });

  void _createAuthor(BuildContext context, Author author) {
    authorRepository.createAuthor(author);
    context.goNamed(AuthorsScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(scafoldKey: scafoldKey, selectedScreen: 3),
      appBar: AppBar(
        title: const Text('Create Author'),
      ),
      body: AuthorForm(
        onSave: (author) => _createAuthor(context, author),
      ),
    );
  }
}
