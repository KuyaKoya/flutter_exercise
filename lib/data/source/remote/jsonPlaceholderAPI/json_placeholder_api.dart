import 'package:flutter_exercise/core/network/network.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/album_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/comment_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/queryparams/album_query_params.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/queryparams/photo_query_params.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/photo_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/post_request.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/user_request.dart';

import 'models/queryparams/comment_query_params.dart';
import 'models/queryparams/post_query_params.dart';
import 'models/queryparams/user_query_params.dart';

class JsonPlaceHolderAPI {
  JsonPlaceHolderAPI(this.networkManager);

  final NetworkManager networkManager;

  CommentRequest createCommentRequest([CommentQueryParameters? queryParams]) {
    return CommentRequest(
        networkManager, queryParams ?? CommentQueryParameters());
  }

  PostRequest createPostRequest([PostQueryParameters? queryParams]) {
    return PostRequest(networkManager, queryParams ?? PostQueryParameters());
  }

  UserRequest createUserRequest([UserQueryParameters? queryParameters]) {
    return UserRequest(
        networkManager, queryParameters ?? UserQueryParameters());
  }

  AlbumRequest createAlbumRequest([AlbumQueryParams? queryParameters]) {
    return AlbumRequest(networkManager, queryParameters ?? AlbumQueryParams());
  }

  PhotoRequest createPhotoRequest([PhotoQueryParams? queryParams]) {
    return PhotoRequest(networkManager, queryParams ?? PhotoQueryParams());
  }
}
