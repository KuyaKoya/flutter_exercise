abstract class CommentEvent {
  const CommentEvent();
}

class CommentLoadStarted extends CommentEvent {
  final bool loadAll;

  const CommentLoadStarted({this.loadAll = false});
}

class CommentLoadMoreStarted extends CommentEvent {}

class CommentSelectChanged extends CommentEvent {
  final String commentId;

  const CommentSelectChanged({required this.commentId});
}
