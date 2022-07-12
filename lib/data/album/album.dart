import 'package:flutter_exercise/data/response_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album implements ResponseData {
  final String userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });
  @override
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
  
  @override
  factory Album.fromJson(Map<String, dynamic> json) {
    return _$AlbumFromJson(json);
  }
}
