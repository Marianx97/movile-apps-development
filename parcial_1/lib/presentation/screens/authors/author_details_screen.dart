import 'package:flutter/material.dart';
import 'package:parcial_1/datasource/repositories/author_repository.dart';
import 'package:parcial_1/datasource/repositories/book_repository.dart';
import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/presentation/screens/authors/authors_screen.dart';
import 'package:parcial_1/presentation/widgets/delete_button.dart';
import 'package:parcial_1/presentation/widgets/edit_button.dart';
import 'package:parcial_1/presentation/widgets/go_back_button.dart';

class AuthorDetailsScreen extends StatefulWidget {
  static const String name = 'author_detail_screen';
  final int authorId;
  final AuthorRepository authorRepository;

  const AuthorDetailsScreen({
    super.key,
    required this.authorId,
    required this.authorRepository,
  });

  @override
  State<AuthorDetailsScreen> createState() => _AuthorDetailsScreenState();
}

class _AuthorDetailsScreenState extends State<AuthorDetailsScreen> {
  late Future<Author?> authorRequest;

  @override
  void initState() {
    super.initState();
    authorRequest = widget.authorRepository.getAuthorById(widget.authorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(backPath: AuthorsScreen.name),
        title: const Text('Author Detail'),
      ),
      body: FutureBuilder(
        future: authorRequest,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return _AuthorDetailView(author: snapshot.data!);
            } else {
              return const Text('No author found');
            }
          }
        }),
      ),
      floatingActionButton: OverflowBar(
        alignment: MainAxisAlignment.spaceAround,
        children: [
          EditButton(
            editPath: '/authors/edit/${widget.authorId}',
          ),
          DeleteButton(
            elementType: 'Author',
            elementId: widget.authorId.toString(),
          ),
        ],
      ),
    );
  }
}

class _AuthorDetailView extends StatelessWidget {
  final Author author;

  const _AuthorDetailView({required this.author});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: _AuthorDetailContent(author: author),
      ),
    );
  }
}

class _AuthorDetailContent extends StatefulWidget {
  final Author author;

  const _AuthorDetailContent({required this.author});

  @override
  State<_AuthorDetailContent> createState() => _AuthorDetailContentState();
}

class _AuthorDetailContentState extends State<_AuthorDetailContent> {
  late Future<List<Book>> booksRequest;

  @override
  void initState() {
    super.initState();
    booksRequest = BookRepository().getBooksByAuthor(widget.author.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _AuthorImage(imageUrl: widget.author.imageUrl),
        Text(
          widget.author.name,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        FutureBuilder(
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
        const SizedBox(height: 15),
        _AuthorBiographyCard(author: widget.author),
      ],
    );
  }
}

class _AuthorImage extends StatelessWidget {
  final String? imageUrl;

  const _AuthorImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    Image placeholder = const Image(image: AssetImage('assets/images/author_placeholder.png'));
    Image authorImage = imageUrl != null && imageUrl!.isNotEmpty
      ? Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => placeholder,
        )
      : placeholder;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 300,
          width: 250,
          child: authorImage,
        ),
      ),
    );
  }
}

class _AuthorBiographyCard extends StatelessWidget {
  final Author author;

  const _AuthorBiographyCard({required this.author});

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
                  'Biography',
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
        onTap: () => _showFullTextDialog(context, author.biography),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            author.biography,
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
