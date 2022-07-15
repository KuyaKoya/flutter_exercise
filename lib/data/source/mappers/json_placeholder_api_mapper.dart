import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/comment/comment.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/post/post.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/user/user.dart';
import 'package:flutter_exercise/domain/entities/comment_entity.dart';

import '../../../domain/entities/post_entity.dart';

List<PostEntity> toPostEntityList(List<User> users, List<Post> posts) {
  List<PostEntity> postList = [];
  for (var post in posts) {
    User user = users.firstWhere((element) => element.id == post.userId);
    postList.add(PostEntity(
        userId: post.userId,
        userName: user.username,
        id: post.id,
        title: post.title,
        body: post.body));
  }
  return postList;
}

List<CommentEntity> toCommentEntity(List<Comment> comments) {
  List<CommentEntity> commentList = [];
  for (var comment in comments) {
    commentList.add(CommentEntity(
        postId: comment.postId,
        id: comment.id,
        name: comment.name,
        email: comment.email,
        body: comment.body));
  }
  return commentList;
}
