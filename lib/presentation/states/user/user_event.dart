abstract class UserEvent {
  const UserEvent();
}

class UserLoadStarted extends UserEvent {
  final bool loadAll;

  const UserLoadStarted({this.loadAll = false});
}

class UserSelectChanged extends UserEvent {
  final String userId;

  const UserSelectChanged({required this.userId});
}
