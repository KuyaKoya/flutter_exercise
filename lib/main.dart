import 'package:flutter/material.dart';
import 'package:flutter_exercise/posts/screens/home.dart';
import 'posts/screens/home.dart';


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
        title: const Text('Tweeter'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: const HomePage(),
    );
  }
}
