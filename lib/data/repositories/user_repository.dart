import 'package:flutter_exercise/data/source/mappers/json_placeholder_api_mapper.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';
import 'package:flutter_exercise/domain/entities/post_entity.dart';
import 'package:flutter_exercise/domain/entities/user/user_entity.dart';

abstract class IUserRepository {
  Future<List<UserEntity>> getAllUsers();
}

class UserRepository extends IUserRepository {
  UserRepository({required this.jsonPlaceHolderAPI});

  final JsonPlaceHolderAPI jsonPlaceHolderAPI;

  @override
  Future<List<UserEntity>> getAllUsers() async {
    final userList = await jsonPlaceHolderAPI.createUserRequest().getUserList();
    return toUserEntityList(userList);
  }
}
