import '../../domain/entities/post_entity.dart';
import '../source/mappers/json_placeholder_api_mapper.dart';
import '../source/remote/jsonPlaceholderAPI/json_placeholder_api_service.dart';

abstract class IPostRepository {
  Future<List<PostEntity>> getAllPosts();
  void setSelectedPost(PostEntity post);
  int? get selectedPostId;
  int? get selectedUserId;
}

class PostRepository extends IPostRepository {
  PostRepository({required this.jsonPlaceHolderAPIService});

  final JsonPlaceHolderAPIService jsonPlaceHolderAPIService;
  PostEntity? _postEntity;

  @override
  Future<List<PostEntity>> getAllPosts() async {
    final postList = await jsonPlaceHolderAPIService.getPosts();
    final userList = await jsonPlaceHolderAPIService.getUsers();
    return toPostEntityList(userList, postList);
  }

  @override
  int? get selectedPostId => _postEntity?.id;

  @override
  void setSelectedPost(PostEntity post) {
    _postEntity = post;
  }

  @override
  int? get selectedUserId => _postEntity?.userId;
}
