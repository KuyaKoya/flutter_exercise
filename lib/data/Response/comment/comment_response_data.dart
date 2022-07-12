import 'package:json_annotation/json_annotation.dart';

import '../response_data.dart';

part 'comment_response_data.g.dart';

@JsonSerializable()
class CommentResponseData implements ResponseData {
  final String postId;
  final String id;
  final String name;
  final String email;
  final String body;

  CommentResponseData({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  Map<String, dynamic> toJson() => _$CommentToJson(this);
  
  @override
  factory CommentResponseData.fromJson(Map<String, dynamic> json) {
    return _$CommentFromJson(json);
  }
}
