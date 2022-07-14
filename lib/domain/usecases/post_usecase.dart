import 'package:flutter_exercise/data/repositories/post_repository.dart';
import 'package:flutter_exercise/domain/entities/post_entity.dart';
import 'package:flutter_exercise/domain/usecases/post_usecase_interface.dart';

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
