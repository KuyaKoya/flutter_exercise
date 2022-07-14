abstract class PostEvent {
  const PostEvent();
}

class PostLoadStarted extends PostEvent {
  final bool loadAll;

  const PostLoadStarted({this.loadAll = false});
}

class PostLoadMoreStarted extends PostEvent {}

class PostSelectChanged extends PostEvent {
  final String postId;

  const PostSelectChanged({required this.postId});
}
