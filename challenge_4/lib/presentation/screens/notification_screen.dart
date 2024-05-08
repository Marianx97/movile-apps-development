import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatelessWidget {
  static const name = 'notifications_screen';
  const NotificationsScreen({super.key});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Snackbar'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications Screen'),
      ),
      body: const _NotificationView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSnackBar(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _NotificationView extends StatelessWidget {
  const _NotificationView();

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Lorem ipsum something something'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Custom dialog'),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton.tonal(
          onPressed: () {
            showAboutDialog(
              context: context,
              children: [
                const Text('About dialog'),
                const Text('Something Something Something Something'),
              ],
            );
          },
          child: const Text('About dialog'),
        ),
        const SizedBox(height: 10),
        FilledButton.tonal(
          onPressed: () {
            openDialog(context);
          },
          child: const Text('Custom Dialog'),
        ),
      ],
    );
  }
}