import 'package:injectable/injectable.dart';

import '../../core/usecase.dart';
import '../../data/repositories/post_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../entities/user/user_entity.dart';

@Injectable()
class GetAllUsersUseCase extends NoParamsUseCase<List<UserEntity>> {
  final UserRepository _userRepository;
  GetAllUsersUseCase(this._userRepository);

  @override
  Future<List<UserEntity>> call() {
    return _userRepository.getAllUsers();
  }
}

@Injectable()
class GetUserFromPostIdUseCase extends NoParamsUseCase<UserEntity> {
  final UserRepository _userRepository;
  final PostRepository _postRepository;
  GetUserFromPostIdUseCase(this._postRepository, this._userRepository);

  @override
  Future<UserEntity> call() {
    return _userRepository.getUserFromPostId(_postRepository.selectedUserId);
  }
}

@Injectable()
class UpdateSelectedUserUseCase extends UseCase<void, UserEntity> {
  final UserRepository _userRepository;
  UpdateSelectedUserUseCase(this._userRepository);

  @override
  Future<void> call(UserEntity params) async {
    _userRepository.setCurrentUser(params);
  }
}