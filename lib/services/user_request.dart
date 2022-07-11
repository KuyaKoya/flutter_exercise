import 'package:flutter_exercise/services/api_request.dart';

import '../data/user/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';

class UserRequest extends ApiRequest {
  @override
  String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<User>> getPosts() async {
    return super.get().then((data) => 
      compute(super.parse<User>, data)
    );
  }
}
