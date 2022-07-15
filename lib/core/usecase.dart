import 'package:flutter_exercise/data/repositories/base_repository.dart';
import 'package:flutter_exercise/domain/usecases/user_usecase.dart';

import '../domain/usecases/post_usecase.dart';

abstract class IBaseUseCase {
  abstract final BaseRepository baseRepository;
  PostUseCaseImpl get postUseCaseImpl;
  UserUseCaseImpl get userUseCaseImpl;
}

class BaseUseCase extends IBaseUseCase {
  @override
  final BaseRepository baseRepository;

  BaseUseCase(this.baseRepository);

  PostUseCaseImpl get postUseCaseImpl {
    return PostUseCaseImpl(baseRepository);
  }

  UserUseCaseImpl get userUseCaseImpl {
    return UserUseCaseImpl(baseRepository);
  }
}
