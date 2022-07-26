import 'package:injectable/injectable.dart';

import '../../core/usecase.dart';
import '../../data/repositories/comment_repository.dart';
import '../../data/repositories/post_repository.dart';
import '../entities/comment_entity.dart';

@Injectable()
class GetAllCommentsUseCase extends NoParamsUseCase<List<CommentEntity>> {
  final CommentRepository _commentRepository;
  GetAllCommentsUseCase(this._commentRepository);

  @override
  Future<List<CommentEntity>> call() {
    return _commentRepository.getAllComments();
  }
}

@Injectable()
class GetCommentsFromPostIDUseCase extends NoParamsUseCase<List<CommentEntity>> {
  final CommentRepository _commentRepository;
  final PostRepository _postRepository;
  GetCommentsFromPostIDUseCase(this._commentRepository, this._postRepository);

  @override
  Future<List<CommentEntity>> call() {
    return _commentRepository.getCommentsFromPostId(_postRepository.selectedPostId);
  }
}