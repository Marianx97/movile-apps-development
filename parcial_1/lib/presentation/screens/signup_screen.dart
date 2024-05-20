import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:parcial_1/domain/user.dart';
import 'package:parcial_1/presentation/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const name = 'signup_screen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _passwordVisible = false;
  bool _passwordConfVisible = false;
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
    _passwordConfVisible = false;
    super.initState();
  }

  void showSnackBar(String message, BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool anyControllerEmpty() {
    return userController.text.isEmpty
      || emailController.text.isEmpty
      || passController.text.isEmpty
      || passConfController.text.isEmpty;
  }

  bool passwordDiff() {
    return passController.text != passConfController.text;
  }

  bool checkUsernameOrEmailTaken(List<User> users) {
    return users.any((element) => (
      element.email == emailController.text ||
      element.username == userController.text
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up to get the best data on Books',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: userController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter username...',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter email...',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter password...',
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )
              ),
              obscureText: !_passwordVisible,
              enableSuggestions: false,
              autocorrect: false,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passConfController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Confirm password...',
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordConfVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordConfVisible = !_passwordConfVisible;
                    });
                  },
                )
              ),
              obscureText: !_passwordConfVisible,
              enableSuggestions: false,
              autocorrect: false,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.pop(),
                  child: const Text('Back to Login'),
                ),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: () {
                    // Check if any field is empty
                    if (anyControllerEmpty()) {
                      showSnackBar('Missing fields', context);
                      return;
                    }
                
                    // Check if password and confirmation match
                    if (passwordDiff()) {
                      showSnackBar('Password and confirmation must be the same', context);
                      return;
                    }
                
                    // Check if username is taken
                    if (checkUsernameOrEmailTaken(users)) {
                      showSnackBar('A user already for this username/email. Please try with another', context);
                      return;
                    }
                
                    // All fields are valid, we create the user
                    Random random = Random();
                    int randomId = random.nextInt(100);
                
                    User user = User(
                      id: randomId,
                      username: userController.text,
                      email: emailController.text,
                      password: passController.text,
                    );
                    users.add(user);
                
                    showSnackBar('User successfully created', context);
                
                    context.pop();
                  },
                  child: const Text('Sign Up!'),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
