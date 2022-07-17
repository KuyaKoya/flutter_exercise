import 'package:bloc/bloc.dart';
import 'package:flutter_exercise/core/usecase.dart';
import 'package:flutter_exercise/domain/entities/user/user_entity.dart';
import 'package:flutter_exercise/domain/usecases/user_usecase.dart';
import 'package:flutter_exercise/presentation/states/user/user_event.dart';
import 'package:flutter_exercise/presentation/states/user/user_state.dart';
import 'package:stream_transform/stream_transform.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final BaseUseCase _baseUseCase;
  UserUseCaseImpl get _userUseCase {
    return _baseUseCase.userUseCaseImpl;
  }

  UserBloc(this._baseUseCase) : super(const UserState.initial()) {
    on<UserLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  void _onLoadStarted(UserLoadStarted event, Emitter<UserState> emit) async {
    try {
      emit(state.asLoading());

      final List<UserEntity> users = await _userUseCase.getAllUsers();

      emit(state.asLoadSuccess(users));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
