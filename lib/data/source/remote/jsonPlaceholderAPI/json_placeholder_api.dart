import 'package:flutter_exercise/core/network/network.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/comment_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/post_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/user_request.dart';

import 'models/queryparams/comment_query_params.dart';
import 'models/queryparams/post_query_params.dart';
import 'models/queryparams/user_query_params.dart';

class JsonPlaceHolderAPI {
  JsonPlaceHolderAPI(this.networkManager);

  final NetworkManager networkManager;

  CommentRequest createCommentRequest([CommentQueryParameters? queryParams]) {
    return CommentRequest(
        networkManager, queryParams ?? CommentQueryParameters());
  }

  PostRequest createPostRequest([PostQueryParameters? queryParams]) {
    return PostRequest(networkManager, queryParams ?? PostQueryParameters());
  }

  UserRequest createUserRequest([UserQueryParameters? queryParameters]) {
    return UserRequest(
        networkManager, queryParameters ?? UserQueryParameters());
  }
}
