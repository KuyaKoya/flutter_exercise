abstract class AlbumEvent {
  const AlbumEvent();
}

class AlbumLoadStarted extends AlbumEvent {
  final bool loadAll;

  const AlbumLoadStarted({this.loadAll = false});
}

class AlbumLoadMoreStarted extends AlbumEvent {}

class AlbumSelectChanged extends AlbumEvent {
  final String albumId;

  const AlbumSelectChanged({required this.albumId});
}
