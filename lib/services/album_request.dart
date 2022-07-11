import 'package:flutter_exercise/services/api_request.dart';

import '../data/album/album.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';

class AlbumRequest extends ApiRequest {
  @override
  String url = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<Album>> getPosts() async {
    return super.get().then((data) => 
      compute(super.parse<Album>, data)
    );
  }
}
