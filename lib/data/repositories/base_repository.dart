import 'package:flutter_exercise/data/repositories/comment_repository.dart';
import 'package:flutter_exercise/data/repositories/post_repository.dart';
import 'package:flutter_exercise/data/repositories/user_repository.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/user/user.dart';

abstract class IBaseRepository {
  PostRepository get postRepository;
  UserRepository get userRepository;
  CommentRepository get commentRepository;
}

class BaseRepository extends IBaseRepository {
  BaseRepository(this.jsonPlaceHolderAPI);

  final JsonPlaceHolderAPI jsonPlaceHolderAPI;

  late final PostRepository _postRepository =
      PostRepository(jsonPlaceHolderAPI: jsonPlaceHolderAPI);

  late final CommentRepository _commentRepository =
      CommentRepository(jsonPlaceHolderAPI: jsonPlaceHolderAPI);

  late final PostRepository _postRepository =
      UserRepository(jsonPlaceHolderAPI: jsonPlaceHolderAPI);

  PostRepository get postRepository => _postRepository;

  CommentRepository get commentRepository => _commentRepository;

  UserRepository get userRepository => _postRepository;
}
