// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoResponseData _$PhotoFromJson(Map<String, dynamic> json) => PhotoResponseData(
      albumId: json['albumId'] as String,
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$PhotoToJson(PhotoResponseData instance) => <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
