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
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map =  {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
