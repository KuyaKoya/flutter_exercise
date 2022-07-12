import 'package:json_annotation/json_annotation.dart';

import '../response_data.dart';

part 'photo_response_data.g.dart';

@JsonSerializable()
class PhotoResponseData implements ResponseData {
  final String albumId;
  final String id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoResponseData({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
  
  @override
  factory PhotoResponseData.fromJson(Map<String, dynamic> json) {
    return _$PhotoFromJson(json);
  }
}
