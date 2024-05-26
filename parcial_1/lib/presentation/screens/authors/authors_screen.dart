import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/presentation/screens/authors/create_author_screen.dart';
import 'package:parcial_1/presentation/widgets/drawer_menu.dart';

class AuthorsScreen extends StatefulWidget {
  static const name = 'authors_screen';
  const AuthorsScreen({super.key});

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
  @override
  Widget build(BuildContext context) {
    return const _AuthorsView();
  }
}

class _AuthorsView extends StatefulWidget {
  const _AuthorsView();

  @override
  State<_AuthorsView> createState() => _AuthorsViewState();
}

class _AuthorsViewState extends State<_AuthorsView> {
  final scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      drawer: DrawerMenu(scafoldKey: scafoldKey, selectedScreen: 2),
      appBar: AppBar(
        title: const Text('Authors View'),
      ),
      body: const _AuthorsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(CreateAuthorScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AuthorsList extends StatefulWidget {
  const _AuthorsList();

  @override
  State<_AuthorsList> createState() => _AuthorsListState();
}

class _AuthorsListState extends State<_AuthorsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: authors.length,
        itemBuilder: (context, index) {
          final author = authors[index];
          return _AuthorItem(author: author);
        }
      ),
    );
  }
}

class _AuthorItem extends StatelessWidget {
  final Author author;

  const _AuthorItem({
    required this.author
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          author.name,
        ),
        subtitle: Text('Registered books: ${author.books()}'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => _goToAuthorDetails(context, author),
      ),
    );
  }
}

void _goToAuthorDetails(BuildContext context, Author author) {
  context.go('/author_detail/${author.id}');
}
