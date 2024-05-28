import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/datasource/repositories/user_repository.dart';
import 'package:parcial_1/datasource/repositories/user_session_repository.dart';

import 'package:parcial_1/domain/user.dart';
import 'package:parcial_1/domain/user_session.dart';
import 'package:parcial_1/presentation/screens/books/books_screen.dart';
import 'package:parcial_1/presentation/screens/signup_screen.dart';

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
  late Future<List<User>> usersRequest;

  @override
  void initState() {
    _passwordVisible = false;
    usersRequest = UserRepository().getUsers();
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
    String user = userController.text.trim();

    return users.any((element) =>
      (element.email == user || element.username == user) &&
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
            FutureBuilder(
              future: usersRequest,
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasData) {
                    return ElevatedButton(
                      onPressed: () {
                        if(userController.text.isEmpty || passController.text.isEmpty) {
                          showSnackBar('Both credentials must be present', context);
                          return;
                        }

                        if (checkUserPresent(snapshot.data!)) {
                          User user = snapshot.data!.firstWhere((element) {
                            String user = userController.text.trim();
                            return (element.email == user || element.username == user)
                              && element.password == passController.text;
                            });

                          UserSessionRepository().createUserSession(UserSession(userId: user.id!));

                          context.goNamed(BooksScreen.name);
                        } else {
                          showSnackBar('Invalid credentials', context);
                          return;
                        }
                      },
                      child: const Text('Login'),
                    );
                  } else {
                    return const Text('Something Failed');
                  }
                }
              }),
            ),
            const SizedBox(height: 40),
            const Text('... or sign up if you don\'t have an account'),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                userController.text = '';
                passController.text = '';
                setState(() {
                  _passwordVisible = false;
                });
                context.pushNamed(SignUpScreen.name);
              },
              child: const Text('Sign Up!'),
            )
          ],
        ),
      ),
    );
  }
}
