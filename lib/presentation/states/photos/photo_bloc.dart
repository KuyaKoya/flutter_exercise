import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/usecase.dart';
import '../../../domain/entities/photo_entity.dart';
import '../../../domain/usecases/photo_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

import 'photo_event.dart';
import 'photo_state.dart';

@Singleton()
class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final GetAllPhotosUseCase _getAllPhotosUseCase;
  final GetPhotosFromAlbumIDUseCase _getPhotosFromAlbumIDUseCase;

  PhotoBloc(this._getAllPhotosUseCase, this._getPhotosFromAlbumIDUseCase) : super(const PhotoState.initial()) {
    on<PhotoLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  void _onLoadStarted(PhotoLoadStarted event, Emitter<PhotoState> emit) async {
    try {
      emit(state.asLoading());

      final List<PhotoEntity> photos = await _getPhotosFromAlbumIDUseCase.call();
 
      emit(state.asLoadSuccess(photos));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
