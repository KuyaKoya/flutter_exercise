import 'package:flutter_exercise/data/source/mappers/json_placeholder_api_mapper.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';
import 'package:flutter_exercise/domain/entities/album_entity.dart';

abstract class IAlbumRepository {
  Future<List<AlbumEntity>> getAllAlbums();
  Future<List<AlbumEntity>> getAlbumsFromUserId(String userId);
}

class AlbumRepository extends IAlbumRepository {
  AlbumRepository({required this.jsonPlaceHolderAPI});

  final JsonPlaceHolderAPI jsonPlaceHolderAPI;

  @override
  Future<List<AlbumEntity>> getAllAlbums() async {
    final albumList = await jsonPlaceHolderAPI.albumRequest.getAlbumList();
    return toAlbumEntityList(albumList);
  }

  @override
  Future<List<AlbumEntity>> getAlbumsFromUserId(String userId) async {
    final albumList =
        await jsonPlaceHolderAPI.albumRequest.getAlbumListFromUserId(userId);
    return toAlbumEntityList(albumList);
  }
}
