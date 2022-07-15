import 'dart:convert';

import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/api_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/comment/comment.dart';

import '../../../../core/constants.dart' as constants;
import '../../../../core/network/network.dart';

class CommentRequest extends ApiRequest {
  final String _endpoint = '/comments';
  final String? postId;
  final String? id;
  final String? name;
  final String? email;
  final String? body;

  CommentRequest(networkManager,
      {this.postId, this.id, this.name, this.email, this.body})
      : super(networkManager);

  Future<List<Comment>> getCommentList() async {
    final response = await super.request(RequestMethod.get, _endpoint, toMap(),
        constants.JSON_PLACEHOLDER_API_URL);
    final parsed = jsonDecode(response.data).cast<Map<String, dynamic>>();
    return List<Comment>.from(parsed.map((json) => Comment.fromJson(json)).toList());
  }

  Map<String, String> toMap() {
    Map<String, String> map =  {
      'postId': postId.toString(),
      'id': id.toString(),
      'name': name.toString(),
      'email': email.toString(),
      'body': body.toString()
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }
}
