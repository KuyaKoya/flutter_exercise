import 'dart:convert';

import 'package:flutter_exercise/core/network/network.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/api_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/post/post.dart';

class PostRequest extends ApiRequest {
  final String _endpoint = '/posts';
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostRequest(baseUrl, {this.userId, this.id, this.title, this.body}) : super(baseUrl);

  Future<List<Post>> getPostList() async {
    final parsed = await super.request(RequestMethod.get, _endpoint, toMap()).then(
      (response) => jsonDecode(response.data).cast<Map<String, dynamic>>()
    );

    return List<Post>.from(parsed.map((json) => Post.fromJson(json)).toList());
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}