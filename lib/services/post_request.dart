import 'package:flutter_exercise/services/api_request.dart';

import '../data/post/post.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class PostRequest extends ApiRequest {
  PostRequest() : super('https://jsonplaceholder.typicode.com/posts');

  Future<List<Post>> getPosts() async {
    return super.get().then((data) => 
      compute(super.parse<Post>, data)
    );
  }
}