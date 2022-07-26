import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../core/usecase.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/post_usecase.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final BaseUseCase _baseUseCase;
  PostUseCaseImpl get _postUseCase {
    return _baseUseCase.postUseCaseImpl;
  }

  PostBloc(this._baseUseCase) : super(const PostState.initial()) {
    on<PostLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<PostSelectChanged>(
      _onItemSelected,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  void _onLoadStarted(PostLoadStarted event, Emitter<PostState> emit) async {
    try {
      emit(state.asLoading());

      final List<PostEntity> posts = await _postUseCase.getAllPosts();

      emit(state.asLoadSuccess(posts));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onItemSelected(PostSelectChanged event, Emitter<PostState> emit) async {
    try {
      _postUseCase.setSelectedPost(event.post);
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
