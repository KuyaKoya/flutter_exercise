import 'package:flutter/material.dart';
import 'package:flutter_exercise/data/Response/post/post_response_data.dart';
import 'post_item.w.dart';

class PostList extends StatelessWidget {
  const PostList(this.posts);

  final List<PostResponseData> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var post in posts) PostItem(post.title, post.body),
      ],
    );
  }
}
