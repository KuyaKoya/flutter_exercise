import 'package:bloc/bloc.dart';
import 'package:flutter_exercise/core/usecase.dart';
import 'package:flutter_exercise/domain/usecases/comment_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../domain/entities/comment_entity.dart';
import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final BaseUseCase _baseUseCase;
  CommentUseCaseImpl get _commentUseCase {
    return _baseUseCase.commentUseCaseImpl;
  }

  CommentBloc(this._baseUseCase) : super(const CommentState.initial()) {
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
          await _commentUseCase.getCommentsFromPostId();

      emit(state.asLoadSuccess(comments));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
