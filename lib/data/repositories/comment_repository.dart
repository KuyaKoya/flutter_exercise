import 'package:injectable/injectable.dart';

import '../source/mappers/json_placeholder_api_mapper.dart';
import '../source/remote/jsonPlaceholderAPI/json_placeholder_api_service.dart';

import '../../domain/entities/comment_entity.dart';

abstract class CommentRepository {
  Future<List<CommentEntity>> getAllComments();
  Future<List<CommentEntity>> getCommentsFromPostId(int? id);
}

@Singleton(as: CommentRepository)
class CommentRepositoryImpl extends CommentRepository {
  CommentRepositoryImpl({required this.jsonPlaceHolderAPIService});

  final JsonPlaceHolderAPIService jsonPlaceHolderAPIService;

  @override
  Future<List<CommentEntity>> getAllComments() async {
    final comments = await jsonPlaceHolderAPIService.getComments();
    return toCommentEntity(comments);
  }

  @override
  Future<List<CommentEntity>> getCommentsFromPostId(int? id) async {
    final comments = await jsonPlaceHolderAPIService.getComments(postId: id);
    return toCommentEntity(comments);
  }
}
