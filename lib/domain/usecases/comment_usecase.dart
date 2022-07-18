import 'package:flutter_exercise/data/repositories/post_repository.dart';
import 'package:flutter_exercise/domain/entities/comment_entity.dart';

import '../../core/usecase.dart';
import '../../data/repositories/comment_repository.dart';

abstract class ICommentUseCase extends BaseUseCase {
  ICommentUseCase(super.baseRepository);
  Future<List<CommentEntity>> getAllComments();
  Future<List<CommentEntity>> getCommentsFromPostId();
}

class CommentUseCaseImpl extends ICommentUseCase {
  CommentUseCaseImpl(super.baseRepository);

  late final CommentRepository _commentRepository =
      super.baseRepository.commentRepository;
  late final PostRepository _postRepository =
      super.baseRepository.postRepository;

  @override
  Future<List<CommentEntity>> getAllComments() {
    return _commentRepository.getAllComments();
  }

  @override
  Future<List<CommentEntity>> getCommentsFromPostId() {
    final id = _postRepository.selectedPostId;
    return _commentRepository.getCommentsFromPostId(id);
  }
}
