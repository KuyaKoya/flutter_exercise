import 'package:flutter_exercise/domain/entities/comment_entity.dart';

import '../../core/usecase.dart';
import '../../data/repositories/comment_repository.dart';

abstract class ICommentUseCase extends BaseUseCase {
  ICommentUseCase(super.baseRepository);
  Future<List<CommentEntity>> getAllComments();
}

class CommentUseCaseImpl extends ICommentUseCase {
  CommentUseCaseImpl(super.baseRepository);

  CommentRepository get commentRepository {
    return super.baseRepository.commentRepository;
  }

  @override
  Future<List<CommentEntity>> getAllComments() {
    return commentRepository.getAllComments();
  }
}
