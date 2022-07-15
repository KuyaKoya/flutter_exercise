import 'package:flutter_exercise/data/repositories/post_repository.dart';
import 'package:flutter_exercise/domain/entities/post_entity.dart';

import '../../core/usecase.dart';

abstract class IPostUseCase extends BaseUseCase {
  IPostUseCase(super.baseRepository);
  Future<List<PostEntity>> getAllPosts();
}

class PostUseCaseImpl extends IPostUseCase {
  PostUseCaseImpl(super.baseRepository);

  PostRepository get postRepository {
    return super.baseRepository.postRepository;
  }

  @override
  Future<List<PostEntity>> getAllPosts() {
    return postRepository.getAllPosts();
  }
}
