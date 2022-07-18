import 'package:flutter_exercise/domain/entities/album_entity.dart';

abstract class AlbumEvent {
  const AlbumEvent();
}

class AlbumLoadStarted extends AlbumEvent {
  final bool loadAll;

  const AlbumLoadStarted({this.loadAll = false});
}

class AlbumLoadMoreStarted extends AlbumEvent {}

class AlbumSelectChanged extends AlbumEvent {
  final AlbumEntity album;

  const AlbumSelectChanged({required this.album});
}
