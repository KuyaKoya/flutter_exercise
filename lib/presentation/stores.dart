import 'dart:convert';

import 'package:flutter_flux/flutter_flux.dart';
import 'package:http/http.dart' as http;

// insert actual model
class Post {
  final int userId;
  final int id;
  final String postTitle;
  final String postBody;

  Post(
      {required this.userId,
      required this.id,
      required this.postTitle,
      required this.postBody});

  Post.fromJson(Map json)
      : userId = json['userId'],
        id = json['id'],
        postTitle = json['title'],
        postBody = json['body'];
}

class PostRepo {
  Future<Stream<Post>> getPost() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    var client = http.Client();
    var streamedRes = await client.send(http.Request('get', Uri.parse(url)));

    return streamedRes.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((body) => (body as List))
        .map((json) => Post.fromJson(json));
  }
}

class PostStore extends Store {
  final repo = PostRepo();

  PostStore() {
    triggerOnAction(loadPostsAction, (nothing) async {
      var stream = await repo.getPost();
      if (_post.isEmpty) {
        stream.listen((post) => _post.add(post));
      } else {
        _post.clear();
        stream.listen((post) => _post.add(post));
      }
    });
  }

  final List<Post> _post = <Post>[];
  List<Post> get posts => List<Post>.unmodifiable(_post);
}

final Action loadPostsAction = Action();
final StoreToken postStoreToken = StoreToken(PostStore());
