import 'package:flutter_exercise/domain/entities/user/user_entity.dart';

enum UserStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

class UserState {
  final UserStateStatus status;
  final UserEntity? user;
  final int selectedUserId;
  final Exception? error;

  const UserState._({
    this.status = UserStateStatus.loading,
    this.user,
    this.selectedUserId = 0,
    this.error,
  });

  const UserState.initial() : this._();

  UserState asLoading() {
    return copyWith(
      status: UserStateStatus.loading,
    );
  }

  UserState asLoadSuccess(UserEntity user) {
    return copyWith(
      status: UserStateStatus.loadSuccess,
      user: user,
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
    UserEntity? user,
    int? selectedUserId,
    int? page,
    Exception? error,
  }) {
    return UserState._(
      status: status ?? this.status,
      user: user ?? this.user,
      selectedUserId: selectedUserId ?? this.selectedUserId,
      error: error ?? this.error,
    );
  }
}
