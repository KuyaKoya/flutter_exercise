import 'package:injectable/injectable.dart';

import '../../data/repositories/album_repository.dart';
import '../../data/repositories/photo_repository.dart';
import '../entities/photo_entity.dart';

import '../../core/usecase.dart';

@Injectable()
class GetAllPhotosUseCase extends NoParamsUseCase<List<PhotoEntity>> {
  final PhotoRepository _photoRepository;
  GetAllPhotosUseCase(this._photoRepository);

  @override
  Future<List<PhotoEntity>> call() {
    return _photoRepository.getAllPhotos();
  }
}

@Injectable()
class GetPhotosFromAlbumIDUseCase extends NoParamsUseCase<List<PhotoEntity>> {
  final AlbumRepository _albumRepository;
  final PhotoRepository _photoRepository;
  GetPhotosFromAlbumIDUseCase(this._albumRepository, this._photoRepository);
  
  @override
  Future<List<PhotoEntity>> call() {
    return _photoRepository.getPhotosFromIds(_albumRepository.selectedAlbumId);
  }
}
