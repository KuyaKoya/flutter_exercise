import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/core/network/network.dart';
import 'package:flutter_exercise/core/usecase.dart';
import 'package:flutter_exercise/data/repositories/base_repository.dart';
import 'package:flutter_exercise/data/source/remote/jsonPlaceholderAPI/json_placeholder_api.dart';
import 'package:flutter_exercise/presentation/states/album/album_bloc.dart';
import 'package:flutter_exercise/presentation/states/post/post_bloc.dart';
import 'package:flutter_exercise/presentation/states/themes/theme_cubit.dart';
import 'package:flutter_exercise/presentation/states/user/user_bloc.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),
        RepositoryProvider<JsonPlaceHolderAPI>(
          create: (context) =>
              JsonPlaceHolderAPI(context.read<NetworkManager>()),
        ),
        RepositoryProvider<BaseRepository>(
          create: (context) =>
              BaseRepository(context.read<JsonPlaceHolderAPI>()),
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
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(context.read<BaseUseCase>()),
          ),
          BlocProvider<AlbumBloc>(
            create: (context) => AlbumBloc(context.read<BaseUseCase>()),
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
