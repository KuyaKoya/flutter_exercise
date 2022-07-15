class CommentEntity {
  final String postId;
  final String id;
  final String name;
  final String email;
  final String body;

  CommentEntity({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
}
