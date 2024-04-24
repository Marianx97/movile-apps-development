import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Challenge 1 - Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _backgroundColor = Colors.green;

  void _changeBackgroundColor() {
    setState(() {
      if (0 <= _counter && _counter < 4) {
        _backgroundColor = Colors.green.shade400;
      } else if (4 <= _counter && _counter < 8) {
        _backgroundColor = Colors.yellow.shade400;
      } else {
        _backgroundColor = Colors.red.shade400;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      if (_counter < 10) _counter++;
    });
    _changeBackgroundColor();
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
    _changeBackgroundColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The value of the counter is:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: _incrementCounter,
                  child: const Text('Increment'),
                ),
                TextButton(
                  onPressed: _decrementCounter,
                  child: const Text('Decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: _backgroundColor,
    );
  }
}
