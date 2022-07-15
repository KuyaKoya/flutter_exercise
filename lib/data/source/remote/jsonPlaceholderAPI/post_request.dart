import 'dart:convert';

import 'package:flutter_exercise/core/network/network.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/api_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/post/post.dart';

import '../../../../core/constants.dart' as constants;

class PostRequest extends ApiRequest {
  final String _endpoint = '/posts';
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostRequest(networkManager, {this.userId, this.id, this.title, this.body})
      : super(networkManager);

  Future<List<Post>> getPostList() async {
    final response = await super.request(RequestMethod.get, _endpoint, toMap(),
        constants.JSON_PLACEHOLDER_API_URL);
    final parsed = jsonDecode(response.data).cast<Map<String, dynamic>>();
    return List<Post>.from(parsed.map((json) => Post.fromJson(json)).toList());
  }

  Map<String, String> toMap() {
    Map<String, String> map = {
      'userId': userId.toString(),
      'id': id.toString(),
      'title': title.toString(),
      'body': body.toString()
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }
}
