import 'package:flutter_exercise/data/source/mappers/json_placeholder_api_mapper.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/queryparams/comment_query_params.dart';

import '../../domain/entities/comment_entity.dart';

abstract class ICommentRepository {
  Future<List<CommentEntity>> getAllComments();
  Future<List<CommentEntity>> getCommentsFromPostId(String id);
}

class CommentRepository extends ICommentRepository {
  CommentRepository({required this.jsonPlaceHolderAPI});

  final JsonPlaceHolderAPI jsonPlaceHolderAPI;

  @override
  Future<List<CommentEntity>> getAllComments() async {
    final commentList =
        await jsonPlaceHolderAPI.createCommentRequest().getCommentList();
    return toCommentEntity(commentList);
  }

  @override
  Future<List<CommentEntity>> getCommentsFromPostId(String id) async {
    final commentList = await jsonPlaceHolderAPI
        .createCommentRequest(CommentQueryParameters(postId: id))
        .getCommentList();
    return toCommentEntity(commentList);
  }
}
