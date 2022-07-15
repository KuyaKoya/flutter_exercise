import 'dart:convert';

import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/api_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/DTO/album/album.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/queryparams/album_query_params.dart';

import '../../../../core/constants.dart' as constants;
import '../../../../core/network/network.dart';

class AlbumRequest extends ApiRequest {
  final String _endpoint = "/albums";
  final AlbumQueryParams queryParams;
  AlbumRequest(networkManager, this.queryParams) : super(networkManager);

  Future<List<Album>> getAlbumList() async {
    final response = await super.request(RequestMethod.get, _endpoint,
        queryParams.toMap(), constants.JSON_PLACEHOLDER_API_URL);
    final parsed = jsonDecode(response.data).cast<Map<String, dynamic>>();
    return List<Album>.from(
        parsed.map((json) => Album.fromJson(json)).toList());
  }
}
