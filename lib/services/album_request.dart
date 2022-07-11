import 'package:flutter_exercise/services/api_request.dart';

import '../data/album/album.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class AlbumRequest extends ApiRequest {
  AlbumRequest() : super('https://jsonplaceholder.typicode.com/albums');

  Future<List<Album>> getPosts() async {
    return super.get().then((data) => 
      compute(super.parse<Album>, data)
    );
  }
}
