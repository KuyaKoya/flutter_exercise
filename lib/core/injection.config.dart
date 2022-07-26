// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repositories/album_repository.dart' as _i9;
import '../data/repositories/comment_repository.dart' as _i10;
import '../data/repositories/photo_repository.dart' as _i5;
import '../data/repositories/post_repository.dart' as _i6;
import '../data/repositories/user_repository.dart' as _i8;
import '../data/source/remote/jsonPlaceholderAPI/json_placeholder_api_service.dart'
    as _i4;
import '../domain/usecases/album_usecase.dart' as _i11;
import '../domain/usecases/comment_usecase.dart' as _i12;
import '../domain/usecases/photo_usecase.dart' as _i13;
import '../domain/usecases/post_usecase.dart' as _i7;
import '../domain/usecases/user_usecase.dart' as _i14;
import '../presentation/states/album/album_bloc.dart' as _i18;
import '../presentation/states/comment/comment_bloc.dart' as _i19;
import '../presentation/states/photos/photo_bloc.dart' as _i15;
import '../presentation/states/post/post_bloc.dart' as _i16;
import '../presentation/states/user/user_bloc.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerDio = _$RegisterDio();
  gh.factory<_i3.Dio>(() => registerDio.dio);
  gh.singleton<_i4.JsonPlaceHolderAPIService>(
      _i4.JsonPlaceHolderAPIService(get<_i3.Dio>()));
  gh.singleton<_i5.PhotoRepository>(_i5.PhotoRepositoryImpl(
      jsonPlaceHolderAPIService: get<_i4.JsonPlaceHolderAPIService>()));
  gh.singleton<_i6.PostRepository>(_i6.PostRepositoryImpl(
      jsonPlaceHolderAPIService: get<_i4.JsonPlaceHolderAPIService>()));
  gh.factory<_i7.UpdateSelectedPostUseCase>(
      () => _i7.UpdateSelectedPostUseCase(get<_i6.PostRepository>()));
  gh.singleton<_i8.UserRepository>(_i8.UserRepositoryImpl(
      jsonPlaceHolderAPIService: get<_i4.JsonPlaceHolderAPIService>()));
  gh.singleton<_i9.AlbumRepository>(_i9.AlbumRepositoryImpl(
      jsonPlaceHolderAPIService: get<_i4.JsonPlaceHolderAPIService>()));
  gh.singleton<_i10.CommentRepository>(_i10.CommentRepositoryImpl(
      jsonPlaceHolderAPIService: get<_i4.JsonPlaceHolderAPIService>()));
  gh.factory<_i11.GetAlbumsFromUserIDUseCase>(() =>
      _i11.GetAlbumsFromUserIDUseCase(
          get<_i8.UserRepository>(), get<_i9.AlbumRepository>()));
  gh.factory<_i11.GetAllAlbumsUseCase>(
      () => _i11.GetAllAlbumsUseCase(get<_i9.AlbumRepository>()));
  gh.factory<_i12.GetAllCommentsUseCase>(
      () => _i12.GetAllCommentsUseCase(get<_i10.CommentRepository>()));
  gh.factory<_i13.GetAllPhotosUseCase>(
      () => _i13.GetAllPhotosUseCase(get<_i5.PhotoRepository>()));
  gh.factory<_i7.GetAllPostsUseCase>(
      () => _i7.GetAllPostsUseCase(get<_i6.PostRepository>()));
  gh.factory<_i14.GetAllUsersUseCase>(
      () => _i14.GetAllUsersUseCase(get<_i8.UserRepository>()));
  gh.factory<_i12.GetCommentsFromPostIDUseCase>(() =>
      _i12.GetCommentsFromPostIDUseCase(
          get<_i10.CommentRepository>(), get<_i6.PostRepository>()));
  gh.factory<_i13.GetPhotosFromAlbumIDUseCase>(() =>
      _i13.GetPhotosFromAlbumIDUseCase(
          get<_i9.AlbumRepository>(), get<_i5.PhotoRepository>()));
  gh.factory<_i14.GetUserFromPostIdUseCase>(() => _i14.GetUserFromPostIdUseCase(
      get<_i6.PostRepository>(), get<_i8.UserRepository>()));
  gh.singleton<_i15.PhotoBloc>(_i15.PhotoBloc(get<_i13.GetAllPhotosUseCase>(),
      get<_i13.GetPhotosFromAlbumIDUseCase>()));
  gh.singleton<_i16.PostBloc>(_i16.PostBloc(
      get<_i7.GetAllPostsUseCase>(), get<_i7.UpdateSelectedPostUseCase>()));
  gh.factory<_i11.UpdateSelectedAlbumUseCase>(
      () => _i11.UpdateSelectedAlbumUseCase(get<_i9.AlbumRepository>()));
  gh.factory<_i14.UpdateSelectedUserUseCase>(
      () => _i14.UpdateSelectedUserUseCase(get<_i8.UserRepository>()));
  gh.singleton<_i17.UserBloc>(_i17.UserBloc(
      get<_i14.GetAllUsersUseCase>(),
      get<_i14.GetUserFromPostIdUseCase>(),
      get<_i14.UpdateSelectedUserUseCase>()));
  gh.singleton<_i18.AlbumBloc>(_i18.AlbumBloc(
      get<_i11.GetAlbumsFromUserIDUseCase>(),
      get<_i11.GetAllAlbumsUseCase>(),
      get<_i11.UpdateSelectedAlbumUseCase>()));
  gh.singleton<_i19.CommentBloc>(_i19.CommentBloc(
      get<_i12.GetAllCommentsUseCase>(),
      get<_i12.GetCommentsFromPostIDUseCase>()));
  return get;
}

class _$RegisterDio extends _i4.RegisterDio {}
