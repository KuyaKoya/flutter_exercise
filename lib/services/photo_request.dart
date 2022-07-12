import 'package:flutter_exercise/services/api_request.dart';

import '../data/Request/request_data.dart';
import '../data/Response/photo/photo.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class PhotoRequest extends ApiRequest {
  PhotoRequest(RequestData request) : super(request);

  Future<List<Photo>> getPhotos() async {
    return super.get().then((data) => 
      compute(super.parse<Photo>, data)
    );
  }
}
