import 'album_repository.dart';
import 'comment_repository.dart';
import 'photo_repository.dart';
import 'post_repository.dart';
import 'user_repository.dart';
import '../source/remote/jsonPlaceholderAPI/json_placeholder_api_service.dart';

abstract class IBaseRepository {
  PostRepository get postRepository;
  CommentRepository get commentRepository;
  AlbumRepository get albumRepository;
  UserRepository get userRepository;
  PhotoRepository get photoRepository;
}

class BaseRepository extends IBaseRepository {
  BaseRepository(this.jsonPlaceHolderAPIService);
  final JsonPlaceHolderAPIService jsonPlaceHolderAPIService;

  late final PostRepository _postRepository =
      PostRepository(jsonPlaceHolderAPIService: jsonPlaceHolderAPIService);

  late final CommentRepository _commentRepository =
      CommentRepository(jsonPlaceHolderAPIService: jsonPlaceHolderAPIService);

  late final AlbumRepository _albumRepository =
      AlbumRepository(jsonPlaceHolderAPIService: jsonPlaceHolderAPIService);

  late final UserRepository _userRepository =
      UserRepository(jsonPlaceHolderAPIService: jsonPlaceHolderAPIService);

  late final PhotoRepository _photoRepository =
      PhotoRepository(jsonPlaceHolderAPIService: jsonPlaceHolderAPIService);

  @override
  PostRepository get postRepository => _postRepository;

  @override
  CommentRepository get commentRepository => _commentRepository;

  @override
  AlbumRepository get albumRepository => _albumRepository;

  @override
  UserRepository get userRepository => _userRepository;

  @override
  PhotoRepository get photoRepository => _photoRepository;
}
