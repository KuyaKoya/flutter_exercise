import 'package:flutter_exercise/services/api_request.dart';

import '../data/user/user.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class UserRequest extends ApiRequest {
  UserRequest() : super("https://jsonplaceholder.typicode.com/users");

  Future<List<User>> getPosts() async {
    return super.get().then((data) => 
      compute(super.parse<User>, data)
    );
  }
}
