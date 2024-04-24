import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:challenge_3/datasource/user_datasource.dart';
import 'package:challenge_3/domain/user.dart';
import 'package:challenge_3/presentation/screens/movies_screen.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'loginScreen';

  LoginScreen({super.key});

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void showSnackBar(String message, BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool checkUserPresent(List<User> users) {
    return users.any((element) =>
      (element.email == userController.text || element.username == userController.text) &&
      element.password == passController.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter your username or email',
                prefixIcon: const Icon(Icons.person_2_outlined),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.password),
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {                
                if(userController.text.isEmpty || passController.text.isEmpty) {
                  showSnackBar('Both credentials must be present', context);
                  return;
                }

                if (checkUserPresent(users)) {
                  context.goNamed(MoviesScreen.name);
                } else {
                  showSnackBar('Invalid credentials', context);
                  return;
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
