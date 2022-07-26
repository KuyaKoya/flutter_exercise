import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/core/network/logging.dart';
import 'core/usecase.dart';
import 'data/repositories/base_repository.dart';
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
  Dio dio = Dio();
  dio.interceptors.add(Logging());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<JsonPlaceHolderAPIService>(
            create: (context) => JsonPlaceHolderAPIService(dio),
          ),
          RepositoryProvider<BaseRepository>(
            create: (context) =>
                BaseRepository(context.read<JsonPlaceHolderAPIService>()),
          ),
          RepositoryProvider<BaseUseCase>(
            create: (context) => BaseUseCase(context.read<BaseRepository>()),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PostBloc>(
              create: (context) => PostBloc(context.read<BaseUseCase>()),
            ),
            BlocProvider<CommentBloc>(
              create: (context) => CommentBloc(context.read<BaseUseCase>()),
            ),
            BlocProvider<UserBloc>(
              create: (context) => UserBloc(context.read<BaseUseCase>()),
            ),
            BlocProvider<AlbumBloc>(
              create: (context) => AlbumBloc(context.read<BaseUseCase>()),
            ),
            BlocProvider<PhotoBloc>(
              create: (context) => PhotoBloc(context.read<BaseUseCase>()),
            ),
            BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit(),
            )
          ],
          child: const MyApp(),
        ),
      ),
    );
  });
}
