import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants.dart';
import 'models/DTO/album/album.dart';
import 'models/DTO/comment/comment.dart';
import 'models/DTO/photo/photo.dart';
import 'models/DTO/post/post.dart';
import 'models/DTO/user/user.dart';

part 'json_placeholder_api_service.g.dart';

@RestApi(baseUrl: jsonPlaceholderAPIUrl)
abstract class JsonPlaceHolderAPIService {
  factory JsonPlaceHolderAPIService(Dio dio) = _JsonPlaceHolderAPIService;

  @GET('/users')
  Future<List<User>> getUsers({
    @Query("id") int? id,
    @Query("userName") String? userName,
    @Query("email") String? email,
    @Query("phone") String? phone,
    @Query("website") String? website,
  });

  @GET('/users/{id}')
  Future<User> getUser(@Path("id") int id);

  @GET('/posts')
  Future<List<Post>> getPosts({
    @Query("id") int? id,
    @Query("userId") int? userId,
    @Query("title") String? title,
    @Query("body") String? body,
  });

  @GET('/posts/{id}')
  Future<Post> getPost(@Path("id") int id);

  @GET('/comments')
  Future<List<Comment>> getComments({
    @Query("id") int? id,
    @Query("postId") int? postId,
    @Query("name") String? name,
    @Query("email") String? email,
    @Query("body") String? body,
  });

  @GET('/comments/{id}')
  Future<Comment> getComment(@Path("id") int id);

  @GET('/albums')
  Future<List<Album>> getAlbums({
    @Query("id") int? id,
    @Query("userId") int? userId,
    @Query("title") String? title,
  });

  @GET('/albums/{id}')
  Future<Album> getAlbum(@Path("id") int id);

  @GET('/photos')
  Future<List<Photo>> getPhotos({
    @Query("id") int? id,
    @Query("albumId") int? albumId,
    @Query("title") String? title,
    @Query("url") String? url,
    @Query("thumbnailUrl") String? thumbnailUrl,
  });

  @GET('/photos/{id}')
  Future<Photo> getPhoto(@Path("id") int id);
}
