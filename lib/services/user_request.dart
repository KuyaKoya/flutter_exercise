import 'package:flutter_exercise/services/api_request.dart';

import '../data/Request/request_data.dart';
import '../data/Response/user/user.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class UserRequest extends ApiRequest {
  UserRequest(RequestData request) : super(request);

  Future<List<User>> getUsers() async {
    return super.get().then((data) => 
      compute(super.parse<User>, data)
    );
  }
}
