import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/domain/book.dart';

class BooksScreen extends StatelessWidget {
  static const name = 'books_screen';
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _BooksView();
  }
}

class _BooksView extends StatelessWidget {
  const _BooksView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books View'),
      ),
      body: const _BooksList(),
    );
  }
}

class _BooksList extends StatelessWidget {
  const _BooksList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return _BookItem(book: book);
      }
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
  context.push('/book_detail/${book.id}');
}
