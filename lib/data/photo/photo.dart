import 'package:json_annotation/json_annotation.dart';

import '../response_data.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo implements ResponseData<Photo> {
  final String albumId;
  final String id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
  
  @override
  factory Photo.fromJson(Map<String, dynamic> json) {
    return _$PhotoFromJson(json);
  }
}
