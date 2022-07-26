import '../source/mappers/json_placeholder_api_mapper.dart';
import '../source/remote/jsonPlaceholderAPI/json_placeholder_api_service.dart';
import '../../domain/entities/photo_entity.dart';

abstract class IPhotoRepository {
  Future<List<PhotoEntity>> getAllPhotos();
  Future<List<PhotoEntity>> getPhotosFromIds(int albumId);
}

class PhotoRepository extends IPhotoRepository {
  PhotoRepository({required this.jsonPlaceHolderAPIService});
  final JsonPlaceHolderAPIService jsonPlaceHolderAPIService;

  @override
  Future<List<PhotoEntity>> getAllPhotos() async {
    final photoList = await jsonPlaceHolderAPIService.getPhotos();
    return toPhotoEntity(photoList);
  }

  @override
  Future<List<PhotoEntity>> getPhotosFromIds(int? albumId) async {
    final photoList =
        await jsonPlaceHolderAPIService.getPhotos(albumId: albumId);
    return toPhotoEntity(photoList);
  }
}
