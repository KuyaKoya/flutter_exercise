import 'package:flutter_exercise/data/source/mappers/json_placeholder_api_mapper.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/queryparams/album_query_params.dart';
import 'package:flutter_exercise/domain/entities/album_entity.dart';

//Hello
abstract class IAlbumRepository {
  Future<List<AlbumEntity>> getAllAlbums();
  Future<List<AlbumEntity>> getAlbumsFromUserId(int id);
}

class AlbumRepository extends IAlbumRepository {
  AlbumRepository({required this.jsonPlaceHolderAPI});

  final JsonPlaceHolderAPI jsonPlaceHolderAPI;

  @override
  Future<List<AlbumEntity>> getAllAlbums() async {
    final albumList =
        await jsonPlaceHolderAPI.createAlbumRequest().getAlbumList();
    return toAlbumEntityList(albumList);
  }

  @override
  Future<List<AlbumEntity>> getAlbumsFromUserId(int id) async {
    final albumList = await jsonPlaceHolderAPI
        .createAlbumRequest(AlbumQueryParams(userId: id))
        .getAlbumList();
    return toAlbumEntityList(albumList);
  }
}
