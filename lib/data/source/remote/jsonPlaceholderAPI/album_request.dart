import 'dart:convert';

import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/api_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/album/album.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/user/user.dart';

import '../../../../core/constants.dart' as constants;
import '../../../../core/network/network.dart';

class AlbumRequest extends ApiRequest {
  final String _endpoint = "/albums";
  final int? id;
  final String? userId;
  final String? title;

  AlbumRequest(networkManager, {this.id, this.userId, this.title})
      : super(networkManager);

  Future<List<Album>> getAlbumList() async {
    final response = await super.request(RequestMethod.get, _endpoint, toMap(),
        constants.JSON_PLACEHOLDER_API_URL);
    final parsed = jsonDecode(response.data).cast<Map<String, dynamic>>();
    return List<Album>.from(
        parsed.map((json) => Album.fromJson(json)).toList());
  }

  Future<List<Album>> getAlbumListFromUserId(String userId) async {
    final response = await super.request(RequestMethod.get, _endpoint,
        toMapUserId(userId), constants.JSON_PLACEHOLDER_API_URL);
    final parsed = jsonDecode(response.data).cast<Map<String, dynamic>>();
    return List<Album>.from(parsed.map((json) => User.fromJson(json)).toList());
  }

  Map<String, String> toMap() {
    Map<String, String> map = {
      'id': id.toString(),
      'userId': userId.toString(),
      'title': title.toString(),
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }

  Map<String, String> toMapUserId(String userId) {
    Map<String, String> map = {
      'id': id.toString(),
      'userId': userId.toString(),
      'title': title.toString(),
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }
}
