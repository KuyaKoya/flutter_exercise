import 'package:flutter/material.dart';
import 'package:flutter_exercise/posts/screens/main_screen.dart';
import 'posts/screens/main_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fleeter'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: const MainScreen(),
    );
  }
}
