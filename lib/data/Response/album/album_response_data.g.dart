// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumResponseData _$AlbumFromJson(Map<String, dynamic> json) => AlbumResponseData(
      userId: json['userId'] as String,
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$AlbumToJson(AlbumResponseData instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
    };
