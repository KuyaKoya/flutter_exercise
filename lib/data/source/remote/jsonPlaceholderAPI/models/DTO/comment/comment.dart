import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  @override
  factory Comment.fromJson(Map<String, dynamic> json) {
    return _$CommentFromJson(json);
  }
}
