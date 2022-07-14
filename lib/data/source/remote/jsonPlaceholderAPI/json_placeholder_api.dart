import 'package:dio/dio.dart';
import 'package:flutter_exercise/core/network/network.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/post/post.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/user/user.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/post_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/user_request.dart';

class JsonPlaceHolderAPI {
  JsonPlaceHolderAPI(this.networkManager);

  final NetworkManager networkManager;

  PostRequest get postRequest {
    return PostRequest(networkManager);
   
  }

  UserRequest get getUsers {
    return UserRequest(networkManager);
  }
}
