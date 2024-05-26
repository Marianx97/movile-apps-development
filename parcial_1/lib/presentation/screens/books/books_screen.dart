import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/presentation/screens/books/create_book_screen.dart';
import 'package:parcial_1/presentation/widgets/drawer_menu.dart';

class BooksScreen extends StatefulWidget {
  static const name = 'books_screen';
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return const _BooksView();
  }
}

class _BooksView extends StatefulWidget {
  const _BooksView();

  @override
  State<_BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<_BooksView> {
  final scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      drawer: DrawerMenu(scafoldKey: scafoldKey, selectedScreen: 0),
      appBar: AppBar(
        title: const Text('Books View'),
      ),
      body: const _BooksList(),
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
  const _BooksList();

  @override
  State<_BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<_BooksList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
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
          padding: const EdgeInsets.all(10),
          child: _BookItemContent(book: book),
        ),
      ),
    );
  }
}

class _BookItemContent extends StatelessWidget {
  const _BookItemContent({
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          /// TODO:
          /// - Change this child for the Image widget
          child: const SizedBox(
            height: 150,
            width: 100,
            child: Placeholder()
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              /// TODO:
              /// - Add function to get author name when book.authorId is present
              Text('Author ${book.authorId != null ? '' : 'unknown'}'),
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
