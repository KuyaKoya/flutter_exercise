import 'package:flutter_exercise/data/Request/request_data.dart';
import 'package:flutter_exercise/data/Response/album/album.dart';
import 'package:flutter_exercise/data/Response/comment/comment.dart';
import 'package:flutter_exercise/data/Response/photo/photo.dart';
import 'package:flutter_exercise/data/Response/post/post.dart';
import 'package:flutter_exercise/data/Response/user/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ApiRequest {
  ApiRequest(this.request);

  RequestData request;

  Future<String> get() async {
    final response = await http.get(request.parseToURL());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  List<T> parse<T>(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    switch (T) {
      case Post:
        return List<T>.from(parsed.map((json) => Post.fromJson(json)).toList());
      case Album:
        return List<T>.from(
            parsed.map((json) => Album.fromJson(json)).toList());
      case Comment:
        return List<T>.from(
            parsed.map((json) => Comment.fromJson(json)).toList());
      case Photo:
        return List<T>.from(
            parsed.map((json) => Photo.fromJson(json)).toList());
      case User:
        return List<T>.from(parsed.map((json) => User.fromJson(json)).toList());
      default:
        throw Exception("Invalid type Error");
    }
  }
}
