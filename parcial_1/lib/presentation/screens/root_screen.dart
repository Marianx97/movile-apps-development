import 'package:flutter/material.dart';
import 'package:parcial_1/datasource/repositories/book_repository.dart';
import 'package:parcial_1/datasource/repositories/user_session_repository.dart';
import 'package:parcial_1/domain/user_session.dart';
import 'package:parcial_1/presentation/screens/books/books_screen.dart';
import 'package:parcial_1/presentation/screens/login_screen.dart';

class RootScreen extends StatefulWidget {
  static const name = 'root_screen';
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late Future<List<UserSession>> userSessionsRequest;

  @override
  void initState() {
    userSessionsRequest = UserSessionRepository().getUserSessions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userSessionsRequest,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const LoginScreen();
            } else {
              return BooksScreen(bookRepository: BookRepository());
            }
          } else {
            return const Text('Something Failed');
          }
        }
      }),
    );
  }
}