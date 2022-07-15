import 'package:flutter_exercise/data/repositories/base_repository.dart';
import 'package:flutter_exercise/domain/usecases/album_usecase.dart';

import '../domain/usecases/post_usecase.dart';

abstract class IBaseUseCase {
  abstract final BaseRepository baseRepository;
  PostUseCaseImpl get postUseCaseImpl;
  AlbumUseCaseImpl get albumUseCaseImpl;
}

class BaseUseCase extends IBaseUseCase {
  @override
  final BaseRepository baseRepository;

  BaseUseCase(this.baseRepository);

  @override
  PostUseCaseImpl get postUseCaseImpl {
    return PostUseCaseImpl(baseRepository);
  }

  @override
  AlbumUseCaseImpl get albumUseCaseImpl {
    return AlbumUseCaseImpl(baseRepository);
  }
}
