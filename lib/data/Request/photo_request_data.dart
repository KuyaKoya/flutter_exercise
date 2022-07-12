import 'package:flutter_exercise/data/Request/request_data.dart';

class PhotoRequestData extends RequestData {
  final String _endpoint = '/photos';
  final String? albumId;
  final String? id;
  final String? title;
  final String? thumbnailUrl;

  PhotoRequestData({this.albumId, this.id, this.title, this.thumbnailUrl});

  @override
  Uri parseToURL() {
    return Uri.https(super.url, _endpoint, toMap());
  }

  @override
  Map<String, String> toMap() {
    Map<String, String> map = {
      'userId' : albumId.toString(),
      'id': id.toString(),
      'title' : title.toString(),
      'thumbnailUrl' : thumbnailUrl.toString()
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }
}