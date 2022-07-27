import '../../../domain/entities/album_entity.dart';

enum AlbumStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class AlbumState {
  final AlbumStateStatus status;
  final List<AlbumEntity> albums;
  final int selectedPostId;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  const AlbumState._({
    this.status = AlbumStateStatus.loading,
    this.albums = const [],
    this.selectedPostId = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const AlbumState.initial() : this._();

  AlbumState asLoading() {
    return copyWith(
      status: AlbumStateStatus.loading,
    );
  }

  AlbumState asLoadSuccess(List<AlbumEntity> posts, {bool canLoadMore = true}) {
    return copyWith(
      status: AlbumStateStatus.loadSuccess,
      albums: posts,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  AlbumState asLoadFailure(Exception e) {
    return copyWith(
      status: AlbumStateStatus.loadFailure,
      error: e,
    );
  }

  AlbumState asLoadingMore() {
    return copyWith(status: AlbumStateStatus.loadingMore);
  }

  AlbumState asLoadMoreSuccess(List<AlbumEntity> newPosts,
      {bool canLoadMore = true}) {
    return copyWith(
      status: AlbumStateStatus.loadMoreSuccess,
      albums: [...albums, ...newPosts],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  AlbumState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: AlbumStateStatus.loadMoreFailure,
      error: e,
    );
  }

  AlbumState copyWith({
    AlbumStateStatus? status,
    List<AlbumEntity>? albums,
    int? selectedPostId,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return AlbumState._(
      status: status ?? this.status,
      albums: albums ?? this.albums,
      selectedPostId: selectedPostId ?? this.selectedPostId,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
