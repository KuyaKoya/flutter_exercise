import 'package:flutter_exercise/data/source/mappers/json_placeholder_api_mapper.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';
import 'package:flutter_exercise/domain/entities/post_entity.dart';

abstract class IPostRepository {
  Future<List<PostEntity>> getAllPosts();
  void setSelectedPost(PostEntity post);
  int? get selectedPostId;
  int? get selectedUserId;
}

class PostRepository extends IPostRepository {
  PostRepository({required this.jsonPlaceHolderAPI});

  final JsonPlaceHolderAPI jsonPlaceHolderAPI;
  PostEntity? _postEntity;

  @override
  Future<List<PostEntity>> getAllPosts() async {
    final postList = await jsonPlaceHolderAPI.createPostRequest().getPostList();
    final userList = await jsonPlaceHolderAPI.createUserRequest().getUserList();
    return toPostEntityList(userList, postList);
  }

  @override
  int? get selectedPostId => _postEntity?.id;

  @override
  void setSelectedPost(PostEntity post) {
    _postEntity = post;
  }
  
  @override
  int? get selectedUserId =>  _postEntity?.userId;
}
