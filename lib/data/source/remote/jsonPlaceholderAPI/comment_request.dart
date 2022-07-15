import 'dart:convert';

import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/api_request.dart';

import '../../../../core/constants.dart' as constants;
import '../../../../core/network/network.dart';
import 'models/DTO/comment/comment.dart';
import 'models/queryparams/comment_query_params.dart';

class CommentRequest extends ApiRequest {
  final String _endpoint = '/comments';
  final CommentQueryParameters queryParams;
  CommentRequest(networkManager, this.queryParams) : super(networkManager);

  Future<List<Comment>> getCommentList() async {
    final response = await super.request(RequestMethod.get, _endpoint, queryParams.toMap(),
        constants.JSON_PLACEHOLDER_API_URL);
    final parsed = jsonDecode(response.data).cast<Map<String, dynamic>>();
    return List<Comment>.from(
        parsed.map((json) => Comment.fromJson(json)).toList());
  }
}
