import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/core/network/logging.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/models/DTO/album/album.dart';
import 'core/injection.dart';
import 'core/usecase.dart';
import 'data/source/remote/jsonPlaceholderAPI/json_placeholder_api_service.dart';
import 'presentation/states/album/album_bloc.dart';
import 'presentation/states/comment/comment_bloc.dart';
import 'presentation/states/photos/photo_bloc.dart';
import 'presentation/states/post/post_bloc.dart';
import 'presentation/states/themes/theme_cubit.dart';
import 'presentation/states/user/user_bloc.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  * Need to create DioClient class and pass it to the BlocProvider
  //  * as one instance of DioClient from Dio
  configureDependencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<PostBloc>(
              create: (context) => getIt<PostBloc>()),
            BlocProvider<CommentBloc>(
              create: (context) => getIt<CommentBloc>()),
            BlocProvider<UserBloc>(
              create: (context) => getIt<UserBloc>()),
            BlocProvider<AlbumBloc>(
              create: (context) => getIt<AlbumBloc>()),
            BlocProvider<PhotoBloc>(
              create: (context) => getIt<PhotoBloc>()),
            BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit(),
            )
          ],
          child: const MyApp(),
        ),
    );
  });
}
