// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponseData _$PostFromJson(Map<String, dynamic> json) => PostResponseData(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$PostToJson(PostResponseData instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
