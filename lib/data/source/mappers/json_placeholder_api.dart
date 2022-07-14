import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/post/post.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/user/user.dart';

import '../../../domain/entities/post_entity.dart';

class JsonPlaceHolderApiMapper {
  JsonPlaceHolderApiMapper();

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
}
