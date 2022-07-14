import 'package:flutter/material.dart';
import 'package:flutter_exercise/presentation/ui/screens/post/post_item.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (var i = 0; i < 10; i++) const PostItem(),
            ],
          ),
        ),
      ],
    );
  }
}
