import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoBackButton extends StatelessWidget {
  final String backPath;

  const GoBackButton({
    super.key,
    required this.backPath,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.goNamed(backPath);
      },
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}
