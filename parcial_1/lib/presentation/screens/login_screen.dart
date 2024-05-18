import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

import 'package:parcial_1/domain/user.dart';

// TODO: delete this and implement repository method
List<User> users = [
  User(id: 1, email: 'alberto@fakemail.com', password: 'pass1', username: 'Albert'),
  User(id: 2, email: 'barbara@fakemail.com', password: 'pass2', username: 'Barbie'),
];

class LoginScreen extends StatefulWidget {
  static const name = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Book-Data App',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 60),
            TextField(
              controller: userController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter your username',
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
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    // color: Theme.of(context).primaryColorDark,
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
            ElevatedButton(
              onPressed: () {
                if(userController.text.isEmpty || passController.text.isEmpty) {
                  showSnackBar('Both credentials must be present', context);
                  return;
                }

                if (checkUserPresent(users)) {
                  print('Correct user');
                  return;
                  // context.goNamed(BooksScreen.name);
                } else {
                  showSnackBar('Invalid credentials', context);
                  return;
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 40),
            const Text('... or sign up if you don\'t have an account'),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                print('Going to signup screen');
                return;
                // context.goNamed(SignUpScreen.name);
              },
              child: const Text('Sign Up!'),
            )
          ],
        ),
      ),
    );
  }
}
