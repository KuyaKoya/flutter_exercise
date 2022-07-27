import 'package:flutter/material.dart';
import 'package:flutter_exercise/presentation/ui/screens/album/album_list.dart';
import 'package:flutter_exercise/presentation/ui/screens/comment/comment_list.dart';
import 'package:flutter_exercise/presentation/ui/screens/photo/photo_list.dart';
import 'package:flutter_exercise/presentation/ui/screens/post/post_list.dart';
import 'package:flutter_exercise/presentation/ui/screens/splash/splash.dart';
import 'package:flutter_exercise/presentation/ui/screens/user/user_screen.dart';
import 'package:flutter_exercise/presentation/res/animations/fade_page_route.dart';

enum Routes { splash, welcome, home, posts, comments, users, albums, photos }

class _Paths {
  static const String splash = '/';
  static const String posts = '/posts';
  static const String comments = '/posts/comments';
  static const String users = '/users';
  static const String albums = '/users/albums';
  static const String photos = '/albums/photos';

// TODO(Anthony): Will refactor the welcome screen
  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.posts: _Paths.posts,
    Routes.comments: _Paths.comments,
    Routes.users: _Paths.users,
    Routes.albums: _Paths.albums,
    Routes.photos: _Paths.photos
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: const SplashScreen());
      case _Paths.comments:
        return FadeRoute(page: const CommentList());
      case _Paths.users:
        return FadeRoute(page: const UserScreen());
      case _Paths.albums:
        return FadeRoute(page: const AlbumList());
      case _Paths.photos:
        return FadeRoute(page: const PhotoList());
      default:
        return FadeRoute(page: const PostList());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
