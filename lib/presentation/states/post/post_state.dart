import '../../../domain/entities/post_entity.dart';

enum PostStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class PostState {
  final PostStateStatus status;
  final List<PostEntity> posts;
  final int selectedPostId;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  const PostState._({
    this.status = PostStateStatus.loading,
    this.posts = const [],
    this.selectedPostId = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const PostState.initial() : this._();

  PostState asLoading() {
    return copyWith(
      status: PostStateStatus.loading,
    );
  }

  PostState asLoadSuccess(List<PostEntity> posts, {bool canLoadMore = true}) {
    return copyWith(
      status: PostStateStatus.loadSuccess,
      posts: posts,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  PostState asLoadFailure(Exception e) {
    return copyWith(
      status: PostStateStatus.loadFailure,
      error: e,
    );
  }

  PostState asLoadingMore() {
    return copyWith(status: PostStateStatus.loadingMore);
  }

  PostState asLoadMoreSuccess(List<PostEntity> newPosts,
      {bool canLoadMore = true}) {
    return copyWith(
      status: PostStateStatus.loadMoreSuccess,
      posts: [...posts, ...newPosts],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  PostState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: PostStateStatus.loadMoreFailure,
      error: e,
    );
  }

  PostState copyWith({
    PostStateStatus? status,
    List<PostEntity>? posts,
    int? selectedPostId,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return PostState._(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      selectedPostId: selectedPostId ?? this.selectedPostId,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
