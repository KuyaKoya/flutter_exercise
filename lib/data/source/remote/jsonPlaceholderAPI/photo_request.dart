import 'dart:convert';

import 'package:flutter_exercise/core/network/network.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/api_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/DTO/photo/photo.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/queryparams/photo_query_params.dart';

import '../../../../core/constants.dart' as constants;

class PhotoRequest extends ApiRequest {
  final String _endpoint = '/photos';
  final PhotoQueryParams queryParams;

  PhotoRequest(networkManager, this.queryParams) : super(networkManager);

  Future<List<Photo>> getPhotoList() async {
    final response = await super.request(RequestMethod.get, _endpoint,
        queryParams.toMap(), constants.JSON_PLACEHOLDER_API_URL);
    final parsed = jsonDecode(response.data).cast<Map<String, dynamic>>();
    return List<Photo>.from(
        parsed.map((json) => Photo.fromJson(json)).toList());
  }
}
