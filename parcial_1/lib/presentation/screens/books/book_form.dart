import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/presentation/screens/books/books_screen.dart';

class BookForm extends StatefulWidget {
  final Book? book;
  final Function(Book) onSave;

  const BookForm({
    super.key,
    this.book,
    required this.onSave
  });

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _summaryController;
  late TextEditingController _authorIdController;
  late TextEditingController _releaseYearController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book?.title ?? '');
    _summaryController = TextEditingController(text: widget.book?.summary ?? '');
    _authorIdController = TextEditingController(text: widget.book?.authorId?.toString() ?? '');
    _releaseYearController = TextEditingController(text: widget.book?.releaseYear?.toString() ?? '');
    _imageUrlController = TextEditingController(text: widget.book?.imageUrl ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _summaryController.dispose();
    _authorIdController.dispose();
    _releaseYearController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final book = Book(
        id: widget.book?.id,
        title: _titleController.text,
        summary: _summaryController.text,
        authorId: int.tryParse(_authorIdController.text),
        releaseYear: int.tryParse(_releaseYearController.text),
        imageUrl: _imageUrlController.text,
      );
      widget.onSave(book);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _summaryController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Summary',
                alignLabelWithHint: true,
                contentPadding: const EdgeInsets.all(16.0), // Adds padding inside the text area
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a summary';
                }

                if (value.length > 1500) {
                  return 'Summary is too long';
                }

                return null;
              },
            ),
            TextFormField(
              controller: _authorIdController,
              decoration: const InputDecoration(labelText: 'Author ID'),
              keyboardType: TextInputType.number,
              // validator: (value) {
              //   if (value != null && value.isNotEmpty && int.tryParse(value) == null) {
              //     return 'Please enter a valid number';
              //   }
              //   return null;
              // },
            ),
            TextFormField(
              controller: _releaseYearController,
              decoration: const InputDecoration(labelText: 'Release Year'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (int.tryParse(value!) == null || int.tryParse(value)! < 0) {
                  return 'Please enter a valid year';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                  onPressed: () {
                    if (widget.book == null) {
                      context.goNamed(BooksScreen.name);
                    } else {
                      context.go('/book_detail/${widget.book?.id}');
                    }
                  },
                  style: FilledButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: _saveForm,
                  child: Text(widget.book == null ? 'Create' : 'Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
