import '../../core/usecase.dart';
import '../../data/repositories/post_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../entities/user/user_entity.dart';

abstract class IUserUseCase extends BaseUseCase {
  IUserUseCase(super.baseRepository);
  Future<List<UserEntity>> getAllUsers();
  Future<UserEntity> getUserFromPostId();
  void setSelectedUser(UserEntity user);
}

class UserUseCaseImpl extends IUserUseCase {
  UserUseCaseImpl(super.baseRepository);

  UserRepository get userRepository {
    return super.baseRepository.userRepository;
  }

  late final UserRepository _userRepository =
      super.baseRepository.userRepository;
  late final PostRepository _postRepository =
      super.baseRepository.postRepository;

  @override
  Future<List<UserEntity>> getAllUsers() {
    return _userRepository.getAllUsers();
  }

  @override
  Future<UserEntity> getUserFromPostId() {
    final id = _postRepository.selectedUserId;

    if (id == null) {
      throw Exception('No user selected');
    }

    return _userRepository.getUserFromPostId(id);
  }

  @override
  void setSelectedUser(UserEntity? user) {
    _userRepository.setCurrentUser(user);
  }
}
