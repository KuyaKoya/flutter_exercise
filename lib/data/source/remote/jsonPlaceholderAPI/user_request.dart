import 'dart:convert';

import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/api_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/user/user.dart';

import '../../../../core/network/network.dart';

class UserRequest extends ApiRequest {
  final String _endpoint = "/users";
  final int? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;

  UserRequest(baseUrl, {this.id, this.username, this.email, this.phone, this.website}) : super(baseUrl);

  Future<List<User>> getUserList() async {
      final parsed = await super.request(RequestMethod.get, _endpoint, toMap()).then(
        (response) => jsonDecode(response.data).cast<Map<String, dynamic>>()
      );

      return List<User>.from(parsed.map((json) => User.fromJson(json)).toList());
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
