import 'package:flutter_exercise/data/Request/request_data.dart';
import 'package:flutter_exercise/data/Response/album/album_response_data.dart';
import 'package:flutter_exercise/data/Response/comment/comment_response_data.dart';
import 'package:flutter_exercise/data/Response/photo/photo_response_data.dart';
import 'package:flutter_exercise/data/Response/post/post_response_data.dart';
import 'package:flutter_exercise/data/Response/user/user_response_data.dart';
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
      case PostResponseData:
        return List<T>.from(parsed.map((json) => PostResponseData.fromJson(json)).toList());
      case AlbumResponseData:
        return List<T>.from(
            parsed.map((json) => AlbumResponseData.fromJson(json)).toList());
      case CommentResponseData:
        return List<T>.from(
            parsed.map((json) => CommentResponseData.fromJson(json)).toList());
      case PhotoResponseData:
        return List<T>.from(
            parsed.map((json) => PhotoResponseData.fromJson(json)).toList());
      case UserResponseData:
        return List<T>.from(parsed.map((json) => UserResponseData.fromJson(json)).toList());
      default:
        throw Exception("Invalid type Error");
    }
  }
}
