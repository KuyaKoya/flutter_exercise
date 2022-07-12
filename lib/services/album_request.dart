import 'package:flutter_exercise/services/api_request.dart';

import '../data/Request/request_data.dart';
import '../data/Response/album/album.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class AlbumRequest extends ApiRequest {
  AlbumRequest(RequestData request) : super(request);

  Future<List<Album>> getAlbums() async {
    return super.get().then((data) => 
      compute(super.parse<Album>, data)
    );
  }
}
