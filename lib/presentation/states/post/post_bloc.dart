import 'package:bloc/bloc.dart';
import 'package:flutter_exercise/domain/usecases/photo_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../core/usecase.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/post_usecase.dart';
import 'post_event.dart';
import 'post_state.dart';

@Singleton()
class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPostsUseCase _getAllPostsUseCase;
  final UpdateSelectedPostUseCase _updateSelectedPostUseCase;

  PostBloc(this._getAllPostsUseCase, this._updateSelectedPostUseCase) : super(const PostState.initial()) {
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

      final List<PostEntity> posts = await _getAllPostsUseCase.call();

      emit(state.asLoadSuccess(posts));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onItemSelected(PostSelectChanged event, Emitter<PostState> emit) async {
    try {
      _updateSelectedPostUseCase.call(event.post);
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
