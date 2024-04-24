import 'package:challenge_2/core/entities/user.dart';
import 'package:challenge_2/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'loginScreen';
  LoginScreen({super.key});

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final List<User> users = [
    User(
      username: 'Bruce01',
      email: 'bruce.wayne@windustries.com',
      password: 'BatLove123',
      hobby: 'detective novels'
    ),
    User(
      username: 'FlyingGrayson02',
      email: 'richard.grayson@windustries.com',
      password: 'NightWing55',
      hobby: 'gymnastics',
    ),
    User(
      username: 'RHood03',
      email: 'jason.todd@windustries.com',
      password: 'crowbar',
      hobby: 'boxing'
    ),
    User(
      username: 'TDrake04',
      email: 'timothy.drake@windustries.com',
      password: 'RR0B1n',
    ),
    User(
      username: 'AssasinD',
      email: 'demian.wayne@windustries.com',
      password: 'supersons',
      hobby: 'drawing'
    ),
  ];

  void showSnackBar(String message, BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

                final User user = users.firstWhere((element) => 
                  (element.email == userController.text || element.username == userController.text) && element.password == passController.text,
                  orElse: () => User(email: '', password: '', username: ''),
                );

                // users.any((element) =>
                //   (element.email == userController.text || element.username == userController.text) &&
                //   element.password == passController.text
                // )
                if (user.username != '') {
                  context.pushNamed(HomeScreen.name, extra: user);
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