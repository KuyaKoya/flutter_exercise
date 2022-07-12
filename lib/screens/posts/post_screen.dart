import 'package:flutter/material.dart';
import 'package:flutter_exercise/data/Request/post_request_data.dart';
import 'package:flutter_exercise/data/Response/post/post.dart';
import 'package:flutter_exercise/services/post_request.dart';

import 'post_list.w.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = PostRequest(PostRequestData()).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: FutureBuilder<List<Post>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PostList(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
