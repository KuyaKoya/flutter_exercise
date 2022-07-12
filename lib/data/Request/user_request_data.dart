import 'package:flutter_exercise/data/Request/request_data.dart';

class UserRequestData extends RequestData {
  final String _endpoint = "/users";
  final int? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;

  UserRequestData(
      {this.id, this.username, this.email, this.phone, this.website});

  @override
  Uri parseToURL() {
    return Uri.https(super.url, _endpoint, toMap());
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'website': website
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
