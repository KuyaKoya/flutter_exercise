import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../core/usecase.dart';
import '../../../domain/entities/user/user_entity.dart';
import '../../../domain/usecases/user_usecase.dart';
import 'user_event.dart';
import 'user_state.dart';

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
    on<UserSelectChanged>(
      _onItemSelected,
      transformer: ((events, mapper) => events.switchMap((mapper))),
    );
  }

  void _onLoadStarted(UserLoadStarted event, Emitter<UserState> emit) async {
    try {
      emit(state.asLoading());

      final UserEntity user = await _userUseCase.getUserFromPostId();

      emit(state.asLoadSuccess(user));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onItemSelected(UserSelectChanged event, Emitter<UserState> emit) async {
    try {
      _userUseCase.setSelectedUser(event.user);
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
