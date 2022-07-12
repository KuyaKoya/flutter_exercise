import 'package:flutter_exercise/data/Request/request_data.dart';

class PostRequestData extends RequestData {
  final String _endpoint = '/posts';
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostRequestData({this.userId, this.id, this.title, this.body});

  @override
  Uri parseToURL() {
    return Uri.https(super.url, _endpoint, toMap());
  }

  @override
  Map<String, String> toMap() {
    Map<String, String> map = {
      'userId': userId.toString(),
      'id': id.toString(),
      'title': title.toString(),
      'body': body.toString()
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }
}
