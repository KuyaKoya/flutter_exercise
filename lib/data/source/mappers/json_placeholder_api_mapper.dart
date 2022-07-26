import '../remote/jsonPlaceholderAPI/models/DTO/photo/photo.dart';
import '../../../domain/entities/comment_entity.dart';
import '../../../domain/entities/photo_entity.dart';
import '../../../domain/entities/user/user_entity.dart';

import '../../../domain/entities/post_entity.dart';
import '../remote/jsonPlaceholderAPI/models/DTO/album/album.dart';
import '../remote/jsonPlaceholderAPI/models/DTO/comment/comment.dart';
import '../remote/jsonPlaceholderAPI/models/DTO/post/post.dart';
import '../remote/jsonPlaceholderAPI/models/DTO/user/user.dart';
import '../../../domain/entities/album_entity.dart';

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

List<AlbumEntity> toAlbumEntityList(List<Album> albums) {
  List<AlbumEntity> albumList = [];
  for (var album in albums) {
    albumList.add(
        AlbumEntity(userId: album.userId, id: album.id, title: album.title));
  }
  return albumList;
}

List<PhotoEntity> toPhotoEntity(List<Photo> photos) {
  List<PhotoEntity> photoList = [];
  for (var photo in photos) {
    photoList.add(PhotoEntity(
        albumId: photo.albumId,
        id: photo.id,
        title: photo.title,
        url: photo.url,
        thumbnailUrl: photo.thumbnailUrl));
  }
  return photoList;
}

List<UserEntity> toUserEntityList(List<User> users) {
  List<UserEntity> userList = [];
  for (var user in users) {
    userList.add(UserEntity(
      id: user.id,
      email: user.email,
      phone: user.phone,
      company: Company(
        name: user.company.name,
        catchPhrase: user.company.catchPhrase,
        bs: user.company.bs,
      ),
      username: user.username,
      website: user.website,
      address: Address(
        street: user.address.street,
        suite: user.address.suite,
        city: user.address.city,
        zipcode: user.address.zipcode,
        geo: Geo(
          lat: user.address.geo.lat,
          lng: user.address.geo.lng,
        ),
      ),
    ));
  }
  return userList;
}

UserEntity toUserEntity(User user) {
  UserEntity userEntity;
  userEntity = UserEntity(
    id: user.id,
    email: user.email,
    phone: user.phone,
    company: Company(
      name: user.company.name,
      catchPhrase: user.company.catchPhrase,
      bs: user.company.bs,
    ),
    username: user.username,
    website: user.website,
    address: Address(
      street: user.address.street,
      suite: user.address.suite,
      city: user.address.city,
      zipcode: user.address.zipcode,
      geo: Geo(
        lat: user.address.geo.lat,
        lng: user.address.geo.lng,
      ),
    ),
  );
  return userEntity;
}
