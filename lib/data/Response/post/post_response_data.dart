
import '../response_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_response_data.g.dart';

@JsonSerializable()
class PostResponseData implements ResponseData {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostResponseData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  Map<String, dynamic> toJson() => _$PostToJson(this);
  
  @override
  factory PostResponseData.fromJson(Map<String, dynamic> json) {
    return _$PostFromJson(json);
  }
}
