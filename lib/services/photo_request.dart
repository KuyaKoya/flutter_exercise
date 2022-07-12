import 'package:flutter_exercise/services/api_request.dart';

import '../data/Request/request_data.dart';
import '../data/Response/photo/photo_response_data.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class PhotoRequest extends ApiRequest {
  PhotoRequest(RequestData request) : super(request);

  Future<List<PhotoResponseData>> getPhotos() async {
    return super.get().then((data) => 
      compute(super.parse<PhotoResponseData>, data)
    );
  }
}
