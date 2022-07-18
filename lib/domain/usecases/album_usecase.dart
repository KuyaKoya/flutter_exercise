import 'package:flutter_exercise/core/usecase.dart';
import 'package:flutter_exercise/domain/entities/album_entity.dart';

abstract class IAlbumUseCase extends BaseUseCase {
  IAlbumUseCase(super.baseRepository);
  Future<List<AlbumEntity>> getAllAlbums();
  Future<List<AlbumEntity>> getAlbumsFromUserId();
  void setSelectedPost(AlbumEntity album);
}

class AlbumUseCaseImpl extends IAlbumUseCase {
  AlbumUseCaseImpl(super.baseRepository);

  late final _albumRepository = super.baseRepository.albumRepository;
  late final _userRepository = super.baseRepository.userRepository;

  @override
  Future<List<AlbumEntity>> getAllAlbums() {
    return _albumRepository.getAllAlbums();
  }

  @override
  Future<List<AlbumEntity>> getAlbumsFromUserId() {
    int? id = _userRepository.currentUserId;
    return _albumRepository.getAlbumsFromUserId(id);
  }

  @override
  void setSelectedPost(AlbumEntity album) {
    _albumRepository.setSelectedPost(album);
  }
}
