import 'dart:convert';

import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/api_request.dart';

import '../../../../core/constants.dart' as constants;
import '../../../../core/network/network.dart';
import 'models/DTO/user/user.dart';
import 'models/queryparams/user_query_params.dart';

class UserRequest extends ApiRequest {
  final String _endpoint = "/users";
  final UserQueryParameters queryParams;

  UserRequest(networkManager, this.queryParams) : super(networkManager);

  Future<List<User>> getUserList() async {
    final response = await super.request(RequestMethod.get, _endpoint,
        queryParams.toMap(), constants.JSON_PLACEHOLDER_API_URL);
    final parsed = jsonDecode(response.data).cast<Map<String, dynamic>>();
    return List<User>.from(parsed.map((json) => User.fromJson(json)).toList());
  }

  
}
