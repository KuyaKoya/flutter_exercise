import 'package:injectable/injectable.dart';

import '../source/mappers/json_placeholder_api_mapper.dart';
import '../source/remote/jsonPlaceholderAPI/json_placeholder_api_service.dart';
import '../../domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getAllUsers();
  Future<UserEntity> getUserFromPostId(int? id);
  void setCurrentUser(UserEntity? user);
  int? get currentUserId;
}

@Singleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({required this.jsonPlaceHolderAPIService});

  final JsonPlaceHolderAPIService jsonPlaceHolderAPIService;
  UserEntity? _currentUser;

  @override
  Future<List<UserEntity>> getAllUsers() async {
    final userList = await jsonPlaceHolderAPIService.getUsers();
    return toUserEntityList(userList);
  }

  @override
  int? get currentUserId => _currentUser?.id;

  @override
  void setCurrentUser(UserEntity? user) {
    _currentUser = user;
  }

  @override
  Future<UserEntity> getUserFromPostId(int? id) async {
    final user = await jsonPlaceHolderAPIService.getUser(id);
    return toUserEntity(user);
  }
}
