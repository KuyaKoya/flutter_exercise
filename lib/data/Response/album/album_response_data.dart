import '../response_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album_response_data.g.dart';

@JsonSerializable()
class AlbumResponseData implements ResponseData {
  final String userId;
  final int id;
  final String title;

  AlbumResponseData({
    required this.userId,
    required this.id,
    required this.title,
  });
  @override
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
  
  @override
  factory AlbumResponseData.fromJson(Map<String, dynamic> json) {
    return _$AlbumFromJson(json);
  }
}
