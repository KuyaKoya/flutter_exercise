import 'package:flutter_exercise/data/source/mappers/json_placeholder_api_mapper.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/queryparams/photo_query_params.dart';
import 'package:flutter_exercise/domain/entities/photo_entity.dart';

abstract class IPhotoRepository {
  Future<List<PhotoEntity>> getAllPhotos();
  Future<List<PhotoEntity>> getPhotosFromIds(int albumId);
}

class PhotoRepository extends IPhotoRepository {
  PhotoRepository({required this.jsonPlaceHolderAPI});
  final JsonPlaceHolderAPI jsonPlaceHolderAPI;

  @override
  Future<List<PhotoEntity>> getAllPhotos() async {
    final photoList =
        await jsonPlaceHolderAPI.createPhotoRequest().getPhotoList();
    return toPhotoEntity(photoList);
  }

  @override
  Future<List<PhotoEntity>> getPhotosFromIds(int? albumId) async {
    final photoList = await jsonPlaceHolderAPI
        .createPhotoRequest(PhotoQueryParams(albumId: albumId))
        .getPhotoList();
    return toPhotoEntity(photoList);
  }
}
