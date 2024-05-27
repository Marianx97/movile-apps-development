import 'package:flutter/material.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/presentation/screens/books/book_image.dart';
import 'package:parcial_1/presentation/screens/books/books_screen.dart';
import 'package:parcial_1/presentation/widgets/edit_button.dart';
import 'package:parcial_1/presentation/widgets/go_back_button.dart';

class BookDetailsScreen extends StatelessWidget {
  static const String name = 'book_detail_screen';
  final int bookId;

  const BookDetailsScreen({
    super.key,
    required this.bookId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(backPath: BooksScreen.name),
        title: const Text('Book Detail'),
      ),
      body: _BookDetailView(bookId: bookId),
      floatingActionButton: EditButton(editPath: '/books/edit/$bookId'),
    );
  }
}

class _BookDetailView extends StatelessWidget {
  final int bookId;

  const _BookDetailView({required this.bookId});

  @override
  Widget build(BuildContext context) {
    final Book book = books.firstWhere((book) => book.id == bookId);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: _BookDetailContent(book: book),
      ),
    );
  }
}

class _BookDetailContent extends StatelessWidget {
  const _BookDetailContent({
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BookImage(
          imageUrl: book.imageUrl,
          height: 300,
          width: 250,
        ),
        const SizedBox(height: 20),
        Text(
          book.title,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        /// TODO:
        /// - Look for a way to separate this in 2 lines if author name is too long
        Text(
          'Author: ${book.authorId ?? 'unknown'} - Release year: ${book.releaseYear}',
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 10),
        _BookSummaryCard(book: book),
      ],
    );
  }
}

/// TODO:
/// - Apply scrolling for long texts

class _BookSummaryCard extends StatelessWidget {
  const _BookSummaryCard({
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          book.summary,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.justify,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
