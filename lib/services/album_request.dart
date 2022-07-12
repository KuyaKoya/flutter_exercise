import 'package:flutter_exercise/services/api_request.dart';

import '../data/Request/request_data.dart';
import '../data/Response/album/album_response_data.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class AlbumRequest extends ApiRequest {
  AlbumRequest(RequestData request) : super(request);

  Future<List<AlbumResponseData>> getAlbums() async {
    return super.get().then((data) => 
      compute(super.parse<AlbumResponseData>, data)
    );
  }
}
