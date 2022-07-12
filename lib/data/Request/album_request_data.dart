import 'package:flutter_exercise/data/Request/request_data.dart';

class AlbumRequestData extends RequestData {
  final String _endpoint = '/albums';
  final String? userId;
  final int? id;
  final String? title;

  AlbumRequestData({this.userId, this.id, this.title,});
  @override
  Uri parseToURL() {
    return Uri.https(super.url, _endpoint, toMap());
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'userId' : userId,
      'id': id,
      'title' : title
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}