import 'package:flutter_exercise/data/repositories/base_repository.dart';
import 'package:flutter_exercise/domain/usecases/comment_usecase.dart';
import 'package:flutter_exercise/domain/usecases/album_usecase.dart';
import 'package:flutter_exercise/domain/usecases/user_usecase.dart';

import '../domain/usecases/post_usecase.dart';

abstract class IBaseUseCase {
  abstract final BaseRepository baseRepository;
  PostUseCaseImpl get postUseCaseImpl;
  CommentUseCaseImpl get commentUseCaseImpl;
  AlbumUseCaseImpl get albumUseCaseImpl;
  UserUseCaseImpl get userUseCaseImpl;
}

class BaseUseCase extends IBaseUseCase {
  @override
  final BaseRepository baseRepository;

  BaseUseCase(this.baseRepository);
  
  @override
  PostUseCaseImpl get postUseCaseImpl => PostUseCaseImpl(baseRepository);
 
  @override
  CommentUseCaseImpl get commentUseCaseImpl => CommentUseCaseImpl(baseRepository);

  @override
  AlbumUseCaseImpl get albumUseCaseImpl {
    return AlbumUseCaseImpl(baseRepository);
  }

  @override
  UserUseCaseImpl get userUseCaseImpl => UserUseCaseImpl(baseRepository);
}
