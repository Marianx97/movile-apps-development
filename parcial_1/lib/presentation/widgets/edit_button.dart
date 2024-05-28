import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditButton extends StatelessWidget {
  final String editPath;

  const EditButton({
    super.key,
    required this.editPath,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        context.go(editPath);
      },
    );
  }
}
