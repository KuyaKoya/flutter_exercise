import 'package:flutter/material.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/post_request.dart';
import 'package:flutter_exercise/presentation/ui/screens/post/post_list.dart';

void main() {
  PostRequest().getPosts();
  runApp(const MaterialApp(
    home: Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostList(),
    );
  }
}
