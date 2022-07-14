import 'package:dio/dio.dart';
import 'package:flutter_exercise/core/network/network.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/post/post.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/user/user.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/post_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/user_request.dart';

class JsonPlaceHolderAPI {
  JsonPlaceHolderAPI();

  static const String baseURL = "https://jsonplaceholder.typicode.com";

  PostRequest get postRequest {
    return PostRequest(baseURL);
   
  }

  UserRequest get getUsers {
    return UserRequest(baseURL);
  }
}
