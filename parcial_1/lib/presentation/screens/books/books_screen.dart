import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/datasource/repositories/author_repository.dart';
import 'package:parcial_1/datasource/repositories/book_repository.dart';
import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/presentation/screens/books/book_image.dart';
import 'package:parcial_1/presentation/screens/books/create_book_screen.dart';
import 'package:parcial_1/presentation/widgets/drawer_menu.dart';

class BooksScreen extends StatefulWidget {
  static const name = 'books_screen';
  final BookRepository bookRepository;

  const BooksScreen({
    super.key,
    required this.bookRepository,
  });

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return _BooksView(bookRepository: widget.bookRepository);
  }
}

class _BooksView extends StatefulWidget {
  final BookRepository bookRepository;

  const _BooksView({required this.bookRepository});

  @override
  State<_BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<_BooksView> {
  final scafoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Book>> booksRequest;

  @override
  void initState() {
    super.initState();
    booksRequest = widget.bookRepository.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      drawer: DrawerMenu(scafoldKey: scafoldKey, selectedScreen: 0),
      appBar: AppBar(
        title: const Text('Books View'),
      ),
      body: FutureBuilder(
        future: booksRequest,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return _BooksList(booksList: snapshot.data!);
            } else {
              return Text(snapshot.error.toString());
            }
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(CreateBookScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _BooksList extends StatefulWidget {
  final List<Book> booksList;
  const _BooksList({required this.booksList});

  @override
  State<_BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<_BooksList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: widget.booksList.length,
        itemBuilder: (context, index) {
          final book = widget.booksList[index];
          return _BookItem(book: book);
        }
      ),
    );
  }
}

class _BookItem extends StatelessWidget {
  final Book book;

  const _BookItem({
    required this.book
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _goToBookDetails(context, book),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: _BookItemContent(book: book),
        ),
      ),
    );
  }
}

class _BookItemContent extends StatefulWidget {
  const _BookItemContent({
    required this.book,
  });

  final Book book;

  @override
  State<_BookItemContent> createState() => _BookItemContentState();
}

class _BookItemContentState extends State<_BookItemContent> {
  late Future<Author?> authorRequest;

  @override
  void initState() {
    super.initState();
    authorRequest = AuthorRepository().getAuthorById(widget.book.authorId ?? -1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BookImage(
            imageUrl: widget.book.imageUrl,
            height: 150,
            width: 100,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.book.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FutureBuilder(
                future: authorRequest,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasData) {
                      return Text(
                        'Author: ${snapshot.data!.name}',
                        style: Theme.of(context).textTheme.bodySmall,
                      );
                    } else {
                      return Text(
                        'Author: unknown',
                        style: Theme.of(context).textTheme.bodySmall,
                      );
                    }
                  }
                }),
              ),
            ],
          ),
        ),
        /// TODO:
        /// - Add function to mark book as favorite for user
        /// - Add logic to change between the filled and the outlined icon
        IconButton(
          onPressed: () {
            print('You liked this book');
          },
          icon: const Icon(Icons.star_outlined, color: Colors.amber),
        ),
      ],
    );
  }
}

void _goToBookDetails(BuildContext context, Book book) {
  context.go('/book_detail/${book.id}');
}
