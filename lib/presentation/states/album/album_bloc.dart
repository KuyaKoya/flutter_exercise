import 'package:bloc/bloc.dart';
import 'package:flutter_exercise/core/usecase.dart';
import 'package:flutter_exercise/domain/usecases/album_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../domain/entities/album_entity.dart';
import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final BaseUseCase _baseUseCase;
  AlbumUseCaseImpl get _albumUseCase {
    return _baseUseCase.albumUseCaseImpl;
  }

  AlbumBloc(this._baseUseCase) : super(const AlbumState.initial()) {
    on<AlbumLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<AlbumSelectChanged>(
      _onItemSelected,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  void _onLoadStarted(AlbumLoadStarted event, Emitter<AlbumState> emit) async {
    try {
      emit(state.asLoading());

      final List<AlbumEntity> album = await _albumUseCase.getAlbumsFromUserId();

      emit(state.asLoadSuccess(album));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onItemSelected(
      AlbumSelectChanged event, Emitter<AlbumState> emit) async {
    try {
      _albumUseCase.setSelectedPost(event.album);
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
