import 'package:flutter_exercise/data/repositories/base_repository.dart';

import '../domain/usecases/post_usecase.dart';

abstract class IBaseUseCase {
  abstract final BaseRepository baseRepository;
  PostUseCaseImpl get postUseCaseImpl;
}

class BaseUseCase extends IBaseUseCase {
  @override
  final BaseRepository baseRepository;

  BaseUseCase(this.baseRepository);

  PostUseCaseImpl get postUseCaseImpl {
    return PostUseCaseImpl(baseRepository);
  }
}
