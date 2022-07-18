import 'package:flutter_exercise/domain/entities/user/user_entity.dart';

abstract class UserEvent {
  const UserEvent();
}

class UserLoadStarted extends UserEvent {
  final bool loadAll;

  const UserLoadStarted({this.loadAll = false});
}

class UserSelectChanged extends UserEvent {
  final UserEntity user;

  const UserSelectChanged({required this.user});
}
