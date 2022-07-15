import 'package:flutter_exercise/core/network/network.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/comment_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/post_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/user_request.dart';

class JsonPlaceHolderAPI {
  JsonPlaceHolderAPI(this.networkManager);

  final NetworkManager networkManager;

  PostRequest get postRequest {
    return PostRequest(networkManager);
  }

  UserRequest get userRequest {
    return UserRequest(networkManager);
  }

  CommentRequest get commentRequest {
    return CommentRequest(networkManager);
  }
}
