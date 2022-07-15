import 'package:flutter_exercise/domain/entities/comment_entity.dart';

enum CommentStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class CommentState {
  final CommentStateStatus status;
  final List<CommentEntity> comments;
  final int selectedCommentId;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  const CommentState._({
    this.status = CommentStateStatus.loading,
    this.comments = const [],
    this.selectedCommentId = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const CommentState.initial() : this._();

  CommentState asLoading() {
    return copyWith(
      status: CommentStateStatus.loading,
    );
  }

  CommentState asLoadSuccess(List<CommentEntity> comments, {bool canLoadMore = true}) {
    return copyWith(
      status: CommentStateStatus.loadSuccess,
      comments: comments,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  CommentState asLoadFailure(Exception e) {
    return copyWith(
      status: CommentStateStatus.loadFailure,
      error: e,
    );
  }

  CommentState asLoadingMore() {
    return copyWith(status: CommentStateStatus.loadingMore);
  }

  CommentState asLoadMoreSuccess(List<CommentEntity> newComments, {bool canLoadMore = true}) {
    return copyWith(
      status: CommentStateStatus.loadMoreSuccess,
      comments: [...comments, ...newComments],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  CommentState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: CommentStateStatus.loadMoreFailure,
      error: e,
    );
  }

  CommentState copyWith({
    CommentStateStatus? status,
    List<CommentEntity>? comments,
    int? selectedCommentId,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return CommentState._(
      status: status ?? this.status,
      comments: comments ?? this.comments,
      selectedCommentId: selectedCommentId ?? this.selectedCommentId,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
