import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/api_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/user/user.dart';

import '../../../../core/constants.dart' as constants;
import '../../../../core/network/network.dart';

class UserRequest extends ApiRequest {
  final String _endpoint = "/users";
  final int? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;

  UserRequest(networkManager,
      {this.id, this.username, this.email, this.phone, this.website})
      : super(networkManager);

  Future<List<User>> getUserList() async {
    final response = await super.request(RequestMethod.get, _endpoint, toMap(),
        constants.JSON_PLACEHOLDER_API_URL);
    final parsed = jsonDecode(response.data).cast<Map<String, dynamic>>();
    return List<User>.from(parsed.map((json) => User.fromJson(json)).toList());
  }

  @override
  Map<String, String> toMap() {
    Map<String, String> map = {
      'id': id.toString(),
      'username': username.toString(),
      'email': email.toString(),
      'phone': phone.toString(),
      'website': website.toString()
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }
}
