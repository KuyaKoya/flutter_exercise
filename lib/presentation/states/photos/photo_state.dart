import 'package:flutter_exercise/domain/entities/photo_entity.dart';

enum PhotoStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class PhotoState {
  final PhotoStateStatus status;
  final List<PhotoEntity> photos;
  final int selectedPhotoId;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  const PhotoState._({
    this.status = PhotoStateStatus.loading,
    this.photos = const [],
    this.selectedPhotoId = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const PhotoState.initial() : this._();

  PhotoState asLoading() {
    return copyWith(
      status: PhotoStateStatus.loading,
    );
  }

  PhotoState asLoadSuccess(List<PhotoEntity> photos,
      {bool canLoadMore = true}) {
    return copyWith(
      status: PhotoStateStatus.loadSuccess,
      photos: photos,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  PhotoState asLoadFailure(Exception e) {
    return copyWith(
      status: PhotoStateStatus.loadFailure,
      error: e,
    );
  }

  PhotoState asLoadingMore() {
    return copyWith(status: PhotoStateStatus.loadingMore);
  }

  PhotoState asLoadMoreSuccess(List<PhotoEntity> newPhotos,
      {bool canLoadMore = true}) {
    return copyWith(
      status: PhotoStateStatus.loadMoreSuccess,
      photos: [...photos, ...newPhotos],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  PhotoState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: PhotoStateStatus.loadMoreFailure,
      error: e,
    );
  }

  PhotoState copyWith({
    PhotoStateStatus? status,
    List<PhotoEntity>? photos,
    int? selectedPhotoId,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return PhotoState._(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      selectedPhotoId: selectedPhotoId ?? this.selectedPhotoId,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
