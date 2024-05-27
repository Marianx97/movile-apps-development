import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/presentation/screens/authors/authors_screen.dart';

class AuthorForm extends StatefulWidget {
  final Author? author;
  final Function(Author) onSave;

  const AuthorForm({
    super.key,
    this.author,
    required this.onSave
  });

  @override
  State<AuthorForm> createState() => _AuthorFormState();
}

class _AuthorFormState extends State<AuthorForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _biographyController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.author?.name ?? '');
    _biographyController = TextEditingController(text: widget.author?.biography ?? '');
    _imageUrlController = TextEditingController(text: widget.author?.imageUrl ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _biographyController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final author = Author(
        id: widget.author?.id,
        name: _nameController.text,
        biography: _biographyController.text,
        imageUrl: _imageUrlController.text,
      );
      widget.onSave(author);
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
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the author\'s name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _biographyController,
              decoration: const InputDecoration(labelText: 'Biography'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the author\'s biography';
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
                    if (widget.author == null) {
                      context.goNamed(AuthorsScreen.name);
                    } else {
                      context.go('/author_detail/${widget.author?.id}');
                    }
                  },
                  style: FilledButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: _saveForm,
                  child: Text(widget.author == null ? 'Create' : 'Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
