import 'package:flutter_exercise/data/source/mappers/json_placeholder_api_mapper.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';
import 'package:flutter_exercise/domain/entities/album_entity.dart';

abstract class IAlbumRepository {
  Future<List<AlbumEntity>> getAllAlbums();
}

class AlbumRepository extends IAlbumRepository {
  AlbumRepository({required this.jsonPlaceHolderAPI});

  final JsonPlaceHolderAPI jsonPlaceHolderAPI;

  @override
  Future<List<AlbumEntity>> getAllAlbums() async {
    final albumList = await jsonPlaceHolderAPI.createAlbumRequest().getAlbumList();
    return toAlbumEntityList(albumList);
  }
}
