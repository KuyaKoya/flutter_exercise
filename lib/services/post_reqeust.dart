import 'dart:developer';

import 'package:flutter_exercise/services/api_request.dart';

import '../data/post/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';

class PostRequest extends ApiRequest {
  @override
  String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPosts() async {
    return super.get().then((data) => 
      compute(super.parse<Post>, data)
    );
  }
}
