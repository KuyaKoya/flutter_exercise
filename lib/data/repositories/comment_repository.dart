import 'package:flutter_exercise/data/source/mappers/json_placeholder_api.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';

import '../../domain/entities/comment_entity.dart';

abstract class ICommentRepository {
  Future<List<CommentEntity>> getAllComments();
}

class CommentRepository extends ICommentRepository {
  CommentRepository({required this.jsonPlaceHolderAPI});

  
  final JsonPlaceHolderAPI jsonPlaceHolderAPI;

  @override
  Future<List<CommentEntity>> getAllComments() async {
    final commentList = await jsonPlaceHolderAPI.commentRequest.getCommentList();
    return toCommentEntity(commentList);
  }
}
