import 'package:flutter_exercise/data/repositories/post_repository.dart';
import 'package:flutter_exercise/data/repositories/user_repository.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/user/user.dart';

abstract class IBaseRepository {
  PostRepository get postRepository;
  UserRepository get userRepository;
}

class BaseRepository extends IBaseRepository {
  BaseRepository(this.jsonPlaceHolderAPI);

  final JsonPlaceHolderAPI jsonPlaceHolderAPI;

  @override
  PostRepository get postRepository {
    return PostRepository(jsonPlaceHolderAPI: jsonPlaceHolderAPI);
  }

  @override
  UserRepository get userRepository {
    return UserRepository(jsonPlaceHolderAPI: jsonPlaceHolderAPI);
  }
}
