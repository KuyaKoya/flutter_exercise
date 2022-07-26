import '../../domain/entities/album_entity.dart';
import '../source/mappers/json_placeholder_api_mapper.dart';
import '../source/remote/jsonPlaceholderAPI/json_placeholder_api_service.dart';

//Hello
abstract class IAlbumRepository {
  Future<List<AlbumEntity>> getAllAlbums();
  Future<List<AlbumEntity>> getAlbumsFromUserId(int? id);
  void setSelectedPost(AlbumEntity album);
  int? get selectedAlbumId;
}

class AlbumRepository extends IAlbumRepository {
  AlbumRepository({required this.jsonPlaceHolderAPIService});

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
