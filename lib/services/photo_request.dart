import 'package:flutter_exercise/services/api_request.dart';

import '../data/photo/photo.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class PhotoRequest extends ApiRequest {
  PhotoRequest() : super('https://jsonplaceholder.typicode.com/photos');

  Future<List<Photo>> getPosts() async {
    return super.get().then((data) => 
      compute(super.parse<Photo>, data)
    );
  }
}
