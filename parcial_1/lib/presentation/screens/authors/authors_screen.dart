import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/datasource/repositories/author_repository.dart';
import 'package:parcial_1/datasource/repositories/book_repository.dart';
import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/presentation/screens/authors/create_author_screen.dart';
import 'package:parcial_1/presentation/widgets/drawer_menu.dart';

class AuthorsScreen extends StatefulWidget {
  static const name = 'authors_screen';
  final AuthorRepository authorRepository;

  const AuthorsScreen({
    super.key,
    required this.authorRepository,
  });

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
  @override
  Widget build(BuildContext context) {
    return _AuthorsView(authorRepository: widget.authorRepository);
  }
}

class _AuthorsView extends StatefulWidget {
  final AuthorRepository authorRepository;

  const _AuthorsView({required this.authorRepository});

  @override
  State<_AuthorsView> createState() => _AuthorsViewState();
}

class _AuthorsViewState extends State<_AuthorsView> {
  final scafoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Author>> authorsRequest;

  @override
  void initState() {
    super.initState();
    authorsRequest = widget.authorRepository.getAuthors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      drawer: DrawerMenu(scafoldKey: scafoldKey, selectedScreen: 2),
      appBar: AppBar(
        title: const Text('Authors View'),
      ),
      body: FutureBuilder(
        future: authorsRequest,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return _AuthorsList(authorsList: snapshot.data!);
            } else {
              return Text(snapshot.error.toString());
            }
          }
        }),
      ),
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
  final List<Author> authorsList;
  const _AuthorsList({required this.authorsList});

  @override
  State<_AuthorsList> createState() => _AuthorsListState();
}

class _AuthorsListState extends State<_AuthorsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: widget.authorsList.length,
        itemBuilder: (context, index) {
          final author = widget.authorsList[index];
          return _AuthorItem(author: author);
        }
      ),
    );
  }
}

class _AuthorItem extends StatefulWidget {
  final Author author;

  const _AuthorItem({
    required this.author
  });

  @override
  State<_AuthorItem> createState() => _AuthorItemState();
}

class _AuthorItemState extends State<_AuthorItem> {
  late Future<List<Book>> booksRequest;

  @override
  void initState() {
    super.initState();
    booksRequest = BookRepository().getBooksByAuthor(widget.author.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.author.name,
        ),
        subtitle: FutureBuilder(
          future: booksRequest,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return Text(
                  'Registered books: ${snapshot.data!.length}',
                );
              } else {
                return const Text('Registered books: 0');
              }
            }
          }),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => _goToAuthorDetails(context, widget.author),
      ),
    );
  }
}

void _goToAuthorDetails(BuildContext context, Author author) {
  context.go('/author_detail/${author.id}');
}
