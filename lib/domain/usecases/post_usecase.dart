import 'package:injectable/injectable.dart';

import '../../core/usecase.dart';
import '../../data/repositories/post_repository.dart';
import '../entities/post_entity.dart';

@Injectable()
class GetAllPostsUseCase extends NoParamsUseCase<List<PostEntity>> {
  final PostRepository _postRepository;
  GetAllPostsUseCase(this._postRepository);

  @override
  Future<List<PostEntity>> call() {
    return _postRepository.getAllPosts();
  }
}

@Injectable()
class UpdateSelectedPostUseCase extends UseCase<void, PostEntity> {
  final PostRepository _postRepository;
  UpdateSelectedPostUseCase(this._postRepository);

  @override
  Future<void> call(PostEntity params) async {
    _postRepository.setSelectedPost(params);
  }
}
