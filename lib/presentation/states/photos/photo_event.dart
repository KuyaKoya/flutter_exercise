abstract class PhotoEvent {
  const PhotoEvent();
}

class PhotoLoadStarted extends PhotoEvent {
  final bool loadAll;

  const PhotoLoadStarted({this.loadAll = false});
}

class PhotosLoadMoreStarted extends PhotoEvent {}

class PhotosSelectChanged extends PhotoEvent {
  final String commentId;

  const PhotosSelectChanged({required this.commentId});
}
