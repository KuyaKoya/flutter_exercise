import 'package:bloc/bloc.dart';

import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(const CommentState.initial()) {
    on<CommentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
