import 'package:flutter_exercise/data/repositories/album_repository.dart';
import 'package:flutter_exercise/data/repositories/photo_repository.dart';
import 'package:flutter_exercise/domain/entities/photo_entity.dart';

import '../../core/usecase.dart';

abstract class IPhotoUseCase extends BaseUseCase {
  IPhotoUseCase(super.baseRepository);
  Future<List<PhotoEntity>> getAllPhotos();
  Future<List<PhotoEntity>> getPhotosFromIds();
}

class PhotoUseCaseImpl extends IPhotoUseCase {
  PhotoUseCaseImpl(super.baseRepository);

  late final PhotoRepository _photoRepository =
      super.baseRepository.photoRepository;
  late final AlbumRepository _albumRepository =
      super.baseRepository.albumRepository;

  @override
  Future<List<PhotoEntity>> getPhotosFromIds() {
    final albumId = _albumRepository.selectedAlbumId;
    return _photoRepository.getPhotosFromIds(albumId);
  }

  @override
  Future<List<PhotoEntity>> getAllPhotos() {
    return _photoRepository.getAllPhotos();
  }
}
