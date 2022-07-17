import 'dart:convert';

import 'package:flutter_exercise/core/network/network.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/api_request.dart';

import '../../../../core/constants.dart' as constants;
import 'models/DTO/post/post.dart';
import 'models/queryparams/post_query_params.dart';

class PostRequest extends ApiRequest {
  final String _endpoint = '/posts';
  final PostQueryParameters queryParams;

  PostRequest(networkManager, this.queryParams) : super(networkManager);

  Future<List<Post>> getPostList() async {
    final response = await super.request(RequestMethod.get, _endpoint,
        queryParams.toMap(), constants.JSON_PLACEHOLDER_API_URL);
    final parsed = jsonDecode(response.data).cast<Map<String, dynamic>>();
    return List<Post>.from(parsed.map((json) => Post.fromJson(json)).toList());
  }
}
