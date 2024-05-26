import 'package:flutter/material.dart';
import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/presentation/screens/authors_screen.dart';
// import 'package:parcial_1/presentation/widgets/edit_button.dart';
import 'package:parcial_1/presentation/widgets/go_back_button.dart';

class AuthorDetailsScreen extends StatelessWidget {
  static const String name = 'author_detail_screen';
  final int authorId;

  const AuthorDetailsScreen({
    super.key,
    required this.authorId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(backPath: AuthorsScreen.name),
        title: const Text('Author Detail'),
      ),
      body: _AuthorDetailView(authorId: authorId),
      // floatingActionButton: EditButton(editPath: '/authors/edit/$authorId'),
    );
  }
}

class _AuthorDetailView extends StatelessWidget {
  final int authorId;
  const _AuthorDetailView({required this.authorId});

  @override
  Widget build(BuildContext context) {
    final Author author = authors.firstWhere((author) => author.id == authorId);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: _AuthorDetailContent(author: author),
      ),
    );
  }
}

class _AuthorDetailContent extends StatelessWidget {
  final Author author;

  const _AuthorDetailContent({required this.author});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _AuthorImage(),
        Text(
          author.name,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Text(
          'Amount of registered books: ${author.books()}',
        ),
        const SizedBox(height: 15),
        _AuthorBiographyCard(author: author),
      ],
    );
  }
}

class _AuthorImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      /// TODO:
      /// - Replace the placeholder for the real image
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: const SizedBox(
          height: 300,
          width: 250,
          child: Placeholder()
        ),
      ),
    );
  }
}

/// TODO:
/// - Apply scrolling for long texts

class _AuthorBiographyCard extends StatelessWidget {
  final Author author;

  const _AuthorBiographyCard({required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
