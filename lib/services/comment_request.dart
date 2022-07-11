import 'package:flutter_exercise/services/api_request.dart';

import '../data/comment/comment.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class CommentRequest extends ApiRequest {
  CommentRequest() : super('https://jsonplaceholder.typicode.com/comments');

  Future<List<Comment>> getPosts() async {
    return super.get().then((data) => 
      compute(super.parse<Comment>, data)
    );
  }
}
