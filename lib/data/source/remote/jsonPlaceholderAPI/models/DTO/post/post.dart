
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
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
