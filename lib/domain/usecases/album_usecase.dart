import 'dart:ffi';

import 'package:flutter_exercise/data/repositories/album_repository.dart';
import 'package:flutter_exercise/data/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/usecase.dart';
import '../entities/album_entity.dart';

@Injectable()
class GetAllAlbumsUseCase extends NoParamsUseCase<List<AlbumEntity>> {
  final AlbumRepository _albumRepository;
  GetAllAlbumsUseCase(this._albumRepository);

  @override
  Future<List<AlbumEntity>> call() {
    return _albumRepository.getAllAlbums();
  }
}

@Injectable()
class GetAlbumsFromUserIDUseCase extends NoParamsUseCase<List<AlbumEntity>> {
  final AlbumRepository _albumRepository;
  final UserRepository _userRepository;
  GetAlbumsFromUserIDUseCase(this._userRepository, this._albumRepository);

  @override
  Future<List<AlbumEntity>> call() {
    return _albumRepository.getAlbumsFromUserId(_userRepository.currentUserId);
  }
}

@Injectable()
class UpdateSelectedAlbumUseCase extends UseCase<void, AlbumEntity> {
  final AlbumRepository _albumRepository;
  UpdateSelectedAlbumUseCase(this._albumRepository);

  @override
  Future<void> call(AlbumEntity params) async {
    _albumRepository.setSelectedPost(params);
  }
}
