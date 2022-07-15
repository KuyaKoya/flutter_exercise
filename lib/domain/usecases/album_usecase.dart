import 'package:flutter_exercise/core/usecase.dart';
import 'package:flutter_exercise/data/repositories/album_repository.dart';
import 'package:flutter_exercise/domain/entities/album_entity.dart';

abstract class IAlbumUseCase extends BaseUseCase {
  IAlbumUseCase(super.baseRepository);
  Future<List<AlbumEntity>> getAllAlbums();
  Future<List<AlbumEntity>> getAlbumsFromUserId(String userId);
}

class AlbumUseCaseImpl extends IAlbumUseCase {
  AlbumUseCaseImpl(super.baseRepository);

  AlbumRepository get albumRepository {
    return super.baseRepository.albumRepository;
  }

  @override
  Future<List<AlbumEntity>> getAllAlbums() {
    return albumRepository.getAllAlbums();
  }

  @override
  Future<List<AlbumEntity>> getAlbumsFromUserId(String userId) {
    return albumRepository.getAlbumsFromUserId(userId);
  }
}
