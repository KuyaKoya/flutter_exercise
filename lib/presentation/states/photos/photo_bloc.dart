import 'package:bloc/bloc.dart';
import '../../../core/usecase.dart';
import '../../../domain/entities/photo_entity.dart';
import '../../../domain/usecases/photo_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

import 'photo_event.dart';
import 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final BaseUseCase _baseUseCase;
  PhotoUseCaseImpl get _photoUseCase {
    return _baseUseCase.photoUseCaseImpl;
  }

  PhotoBloc(this._baseUseCase) : super(const PhotoState.initial()) {
    on<PhotoLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  void _onLoadStarted(PhotoLoadStarted event, Emitter<PhotoState> emit) async {
    try {
      emit(state.asLoading());

      final List<PhotoEntity> photos = await _photoUseCase.getPhotosFromIds();

      emit(state.asLoadSuccess(photos));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
