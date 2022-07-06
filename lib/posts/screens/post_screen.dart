import 'package:flutter/material.dart';
import 'package:flutter_exercise/data/post/post.dart';
import 'package:flutter_exercise/posts/widgets/post.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final List<Post> posts = [
    Post(
        userId: "1",
        id: "1",
        title: "Genshin Impact",
        body:
            "Fanart of Signora with a gun from #GenshinImpact cause I'm still coping that she's gone"),
    Post(
        userId: "2",
        id: "2",
        title: "Monster Hunter",
        body:
            "I JUST CAME TO SAY GORE MAGALA IS BACK BABY \n ALSO DAIMYO HERMITAUR"),
    Post(userId: "3", id: "3", title: "Finding Nemo", body: "Where is my son?"),
    Post(userId: "4", id: "4", title: "Finding Dory", body: "Where am I?"),
    Post(userId: "5", id: "5", title: "Flutter", body: "Ganbaremashou!"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var post in posts) PostContainer(post.title, post.body),
          ],
        ),
      ),
    );
  }
}
