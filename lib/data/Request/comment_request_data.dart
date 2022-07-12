import 'package:flutter_exercise/data/Request/request_data.dart';

class CommentRequestData extends RequestData {
  final String _endpoint = '/comments';
  final String? postId;
  final String? id;
  final String? name;
  final String? email;
  final String? body;

  CommentRequestData({this.postId, this.id, this.name, this.email, this.body});

  @override
  Uri parseToURL() {
    return Uri.https(super.url, _endpoint, toMap());
  }

  @override
  Map<String, String> toMap() {
    Map<String, String> map =  {
      'postId': postId.toString(),
      'id': id.toString(),
      'name': name.toString(),
      'email': email.toString(),
      'body': body.toString()
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }
}
