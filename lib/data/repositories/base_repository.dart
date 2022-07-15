import 'package:flutter_exercise/data/repositories/album_repository.dart';
import 'package:flutter_exercise/data/repositories/comment_repository.dart';
import 'package:flutter_exercise/data/repositories/post_repository.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';

abstract class IBaseRepository {
  PostRepository get postRepository;
  CommentRepository get commentRepository;
  AlbumRepository get albumRepository;
}

class BaseRepository extends IBaseRepository {
  BaseRepository(this.jsonPlaceHolderAPI);

  final JsonPlaceHolderAPI jsonPlaceHolderAPI;

  late final PostRepository _postRepository =
      PostRepository(jsonPlaceHolderAPI: jsonPlaceHolderAPI);

  late final CommentRepository _commentRepository =
      CommentRepository(jsonPlaceHolderAPI: jsonPlaceHolderAPI);

  late final AlbumRepository _albumRepository =
      AlbumRepository(jsonPlaceHolderAPI: jsonPlaceHolderAPI);

  @override
  PostRepository get postRepository => _postRepository;

  @override
  CommentRepository get commentRepository => _commentRepository;

  @override
  AlbumRepository get albumRepository => _albumRepository;
}
