import 'package:flutter_exercise/domain/entities/post_entity.dart';

abstract class PostEvent {
  const PostEvent();
}

class PostLoadStarted extends PostEvent {
  final bool loadAll;

  const PostLoadStarted({this.loadAll = false});
}

class PostLoadMoreStarted extends PostEvent {}

class PostSelectChanged extends PostEvent {
  final PostEntity post;

  const PostSelectChanged({required this.post});
}
