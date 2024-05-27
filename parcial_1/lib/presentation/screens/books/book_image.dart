import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double width;

  const BookImage({
    super.key,
    this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    Image placeholder = const Image(image: AssetImage('assets/images/book_placeholder.jpg'));
    Image bookImage = imageUrl != null && imageUrl!.isNotEmpty
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
          height: height,
          width: width,
          child: bookImage,
        ),
      ),
    );
  }
}
