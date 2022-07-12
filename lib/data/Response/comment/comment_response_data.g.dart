// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponseData _$CommentFromJson(Map<String, dynamic> json) => CommentResponseData(
      postId: json['postId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$CommentToJson(CommentResponseData instance) => <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
