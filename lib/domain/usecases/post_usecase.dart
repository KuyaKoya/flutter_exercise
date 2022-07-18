import 'package:flutter_exercise/data/repositories/post_repository.dart';
import 'package:flutter_exercise/domain/entities/post_entity.dart';

import '../../core/usecase.dart';

abstract class IPostUseCase extends BaseUseCase {
  IPostUseCase(super.baseRepository);
  Future<List<PostEntity>> getAllPosts();
  void setSelectedPost(PostEntity post);
}

class PostUseCaseImpl extends IPostUseCase {
  PostUseCaseImpl(super.baseRepository);

  late final PostRepository _postRepository =
      super.baseRepository.postRepository;

  @override
  Future<List<PostEntity>> getAllPosts() {
    return _postRepository.getAllPosts();
  }

  @override
  void setSelectedPost(PostEntity post) {
    _postRepository.setSelectedPost(post);
  }
}
