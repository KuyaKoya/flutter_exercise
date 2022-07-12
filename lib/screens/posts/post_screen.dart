import 'package:flutter/material.dart';
import 'package:flutter_exercise/data/Request/post_request_data.dart';
import 'package:flutter_exercise/data/Request/user_request_data.dart';
import 'package:flutter_exercise/data/Response/post/post_response_data.dart';
import 'package:flutter_exercise/services/post_request.dart';
import 'package:flutter_exercise/services/user_request.dart';

import '../../data/Response/user/user_response_data.dart';
import 'post_list.w.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<List<PostResponseData>> futurePost;
  late Future<List<UserResponseData>> futureUser;

  @override
  void initState() {
    super.initState();
    futurePost = PostRequest(PostRequestData()).getPosts();
    futureUser = UserRequest(UserRequestData()).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: FutureBuilder<List<PostResponseData>>(
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
