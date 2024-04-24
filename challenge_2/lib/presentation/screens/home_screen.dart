import 'package:challenge_2/core/entities/user.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'homeScreen';

  User user;
  HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: _HomeView(user: user),
    );
  }
}

class _HomeView extends StatelessWidget {
  User user;
  _HomeView({ super.key, required this.user });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome ${user.username}!'),
    );
  }
}
