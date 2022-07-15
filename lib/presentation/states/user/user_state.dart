import 'package:flutter_exercise/domain/entities/post_entity.dart';
import 'package:flutter_exercise/domain/entities/user/user_entity.dart';

enum UserStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

class UserState {
  final UserStateStatus status;
  final List<UserEntity> users;
  final int selectedUserId;
  final Exception? error;

  const UserState._({
    this.status = UserStateStatus.loading,
    this.users = const [],
    this.selectedUserId = 0,
    this.error,
  });

  const UserState.initial() : this._();

  UserState asLoading() {
    return copyWith(
      status: UserStateStatus.loading,
    );
  }

  UserState asLoadSuccess(List<UserEntity> users) {
    return copyWith(
      status: UserStateStatus.loadSuccess,
      users: users,
      page: 1,
    );
  }

  UserState asLoadFailure(Exception e) {
    return copyWith(
      status: UserStateStatus.loadFailure,
      error: e,
    );
  }

  UserState copyWith({
    UserStateStatus? status,
    List<UserEntity>? users,
    int? selectedUserId,
    int? page,
    Exception? error,
  }) {
    return UserState._(
      status: status ?? this.status,
      users: users ?? this.users,
      selectedUserId: selectedUserId ?? this.selectedUserId,
      error: error ?? this.error,
    );
  }
}
