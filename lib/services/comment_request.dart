import 'package:flutter_exercise/services/api_request.dart';

import '../data/Request/request_data.dart';
import '../data/Response/comment/comment.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class CommentRequest extends ApiRequest {
  CommentRequest(RequestData request) : super(request);

  Future<List<Comment>> getComments() async {
    return super.get().then((data) => 
      compute(super.parse<Comment>, data)
    );
  }
}
