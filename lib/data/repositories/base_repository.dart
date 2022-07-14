import 'package:flutter_exercise/data/repositories/post_repository.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';

abstract class IBaseRepository {
  PostRepository get postRepository;
}

class BaseRepository extends IBaseRepository {
  BaseRepository({required this.jsonPlaceHolderAPI});

  final JsonPlaceHolderAPI jsonPlaceHolderAPI;

  @override
  PostRepository get postRepository {
    return PostRepository(jsonPlaceHolderAPI: jsonPlaceHolderAPI);
  }
}
