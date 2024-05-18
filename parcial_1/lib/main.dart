import 'package:flutter/material.dart';
import 'package:parcial_1/core/database/database.dart';

late AppDatabase database;

void main() async {
  // Espera que se hayan inicializado ciertos procesos del flutter engine
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialización de la DB
  database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
