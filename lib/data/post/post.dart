import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter_exercise/data/response_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post implements ResponseData<Post> {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  Map<String, dynamic> toJson() => _$PostToJson(this);
  
  @override
  factory Post.fromJson(Map<String, dynamic> json) {
    return _$PostFromJson(json);
  }
}
