import 'package:flutter_exercise/services/api_request.dart';

import '../data/Request/request_data.dart';
import '../data/Response/post/post_response_data.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class PostRequest extends ApiRequest {
  PostRequest(RequestData request) : super(request);

  Future<List<PostResponseData>> getPosts() async {
    return super.get().then((data) => 
      compute(super.parse<PostResponseData>, data)
    );
  }
}