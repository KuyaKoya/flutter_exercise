import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/usecase.dart';
import '../../../domain/usecases/album_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../domain/entities/album_entity.dart';
import 'album_event.dart';
import 'album_state.dart';

@Singleton()
class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final GetAllAlbumsUseCase _getAllAlbumsUseCase;
  final GetAlbumsFromUserIDUseCase _getAlbumsFromUserIDUseCase;
  final UpdateSelectedAlbumUseCase _updateSelectedAlbumUseCase;

  AlbumBloc(this._getAlbumsFromUserIDUseCase, this._getAllAlbumsUseCase, this._updateSelectedAlbumUseCase) : super(const AlbumState.initial()) {
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

      final List<AlbumEntity> album = await _getAlbumsFromUserIDUseCase.call();

      emit(state.asLoadSuccess(album));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onItemSelected(
      AlbumSelectChanged event, Emitter<AlbumState> emit) async {
    try {
      _updateSelectedAlbumUseCase.call(event.album);
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
