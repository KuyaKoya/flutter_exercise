import 'package:flutter_exercise/core/usecase.dart';
import 'package:flutter_exercise/data/repositories/user_repository.dart';
import 'package:flutter_exercise/domain/entities/user/user_entity.dart';

abstract class IUserUseCase extends BaseUseCase {
  IUserUseCase(super.baseRepository);
  Future<List<UserEntity>> getAllUsers();
}

class UserUseCaseImpl extends IUserUseCase {
  UserUseCaseImpl(super.baseRepository);

  UserRepository get userRepository {
    return super.baseRepository.userRepository;
  }

  @override
  Future<List<UserEntity>> getAllUsers() {
    return userRepository.getAllUsers();
  }
}
