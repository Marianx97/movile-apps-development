import 'package:flutter/material.dart';
import 'package:parcial_1/datasource/repositories/author_repository.dart';
import 'package:parcial_1/datasource/repositories/book_repository.dart';
import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/presentation/screens/books/book_image.dart';
import 'package:parcial_1/presentation/screens/books/books_screen.dart';
import 'package:parcial_1/presentation/widgets/edit_button.dart';
import 'package:parcial_1/presentation/widgets/go_back_button.dart';

class BookDetailsScreen extends StatefulWidget {
  static const String name = 'book_detail_screen';
  final int bookId;
  final BookRepository bookRepository;

  const BookDetailsScreen({
    super.key,
    required this.bookId,
    required this.bookRepository,
  });

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late Future<Book?> bookRequest;

  @override
  void initState() {
    super.initState();
    bookRequest = widget.bookRepository.getBookById(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(backPath: BooksScreen.name),
        title: const Text('Book Detail'),
      ),
      body: FutureBuilder(
        future: bookRequest,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return _BookDetailView(book: snapshot.data!);
            } else {
              return const Text('No book found');
            }
          }
        }),
      ),
      floatingActionButton: EditButton(editPath: '/books/edit/${widget.bookId}'),
    );
  }
}

class _BookDetailView extends StatelessWidget {
  final Book book;

  const _BookDetailView({required this.book});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: _BookDetailContent(book: book),
      ),
    );
  }
}

class _BookDetailContent extends StatefulWidget {
  const _BookDetailContent({
    required this.book,
  });

  final Book book;

  @override
  State<_BookDetailContent> createState() => _BookDetailContentState();
}

class _BookDetailContentState extends State<_BookDetailContent> {
  late Future<Author?> authorRequest;

  @override
  void initState() {
    super.initState();
    authorRequest = AuthorRepository().getAuthorById(widget.book.authorId ?? -1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BookImage(
          imageUrl: widget.book.imageUrl,
          height: 300,
          width: 250,
        ),
        const SizedBox(height: 20),
        Text(
          widget.book.title,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        FutureBuilder(
          future: authorRequest,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return Text(
                  'Author: ${snapshot.data!.name}',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                );
              } else {
                return const Text(
                  'Author: unknown',
                  style: TextStyle(fontStyle: FontStyle.italic),
                );
              }
            }
          }),
        ),
        Text('Release year: ${widget.book.releaseYear}'),
        const SizedBox(height: 10),
        _BookSummaryCard(book: widget.book),
      ],
    );
  }
}

class _BookSummaryCard extends StatelessWidget {
  const _BookSummaryCard({
    required this.book,
  });

  final Book book;

  void _showFullTextDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Summary',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  child: Text(text),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _showFullTextDialog(context, book.summary),
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
      ),
    );
  }
}
