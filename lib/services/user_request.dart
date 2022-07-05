import '../data/user/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRequest {
  String url = "https://jsonplaceholder.typicode.com/users";

  Future<User> getUsers() async {
    final response =  await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
    
    return User.fromJson(json.decode(response.body));
  } else {
  
    throw Exception('Failed to load user');
  }
  }
}
