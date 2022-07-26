import 'package:injectable/injectable.dart';

import '../../domain/entities/album_entity.dart';
import '../source/mappers/json_placeholder_api_mapper.dart';
import '../source/remote/jsonPlaceholderAPI/json_placeholder_api_service.dart';


abstract class AlbumRepository {
  Future<List<AlbumEntity>> getAllAlbums();
  Future<List<AlbumEntity>> getAlbumsFromUserId(int? id);
  void setSelectedPost(AlbumEntity album);
  int? get selectedAlbumId;
}

@Singleton(as: AlbumRepository)
class AlbumRepositoryImpl extends AlbumRepository {
  AlbumRepositoryImpl({required this.jsonPlaceHolderAPIService});

  final JsonPlaceHolderAPIService jsonPlaceHolderAPIService;

  AlbumEntity? _albumEntity;

  @override
  Future<List<AlbumEntity>> getAllAlbums() async {
    final albumList = await jsonPlaceHolderAPIService.getAlbums();
    return toAlbumEntityList(albumList);
  }

  @override
  Future<List<AlbumEntity>> getAlbumsFromUserId(int? id) async {
    final albumList = await jsonPlaceHolderAPIService.getAlbums(userId: id);
    return toAlbumEntityList(albumList);
  }

  @override
  void setSelectedPost(AlbumEntity album) {
    _albumEntity = album;
  }

  @override
  int? get selectedAlbumId => _albumEntity?.id;
}
