import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../core/usecase.dart';
import '../../../domain/entities/comment_entity.dart';
import '../../../domain/usecases/comment_usecase.dart';
import 'comment_event.dart';
import 'comment_state.dart';

@Singleton()
class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetAllCommentsUseCase _getAllCommentsUseCase;
  final GetCommentsFromPostIDUseCase _getCommentsFromPostID;

  CommentBloc(this._getAllCommentsUseCase, this._getCommentsFromPostID) : super(const CommentState.initial()) {
    on<CommentLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  void _onLoadStarted(
      CommentLoadStarted event, Emitter<CommentState> emit) async {
    try {
      emit(state.asLoading());

      final List<CommentEntity> comments =
          await _getCommentsFromPostID.call();

      emit(state.asLoadSuccess(comments));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
