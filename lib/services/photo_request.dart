import 'package:flutter_exercise/services/api_request.dart';

import '../data/photo/photo.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';

class PhotoRequest extends ApiRequest {
  @override
  String url = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photo>> getPosts() async {
    return super.get().then((data) => 
      compute(super.parse<Photo>, data)
    );
  }
}
