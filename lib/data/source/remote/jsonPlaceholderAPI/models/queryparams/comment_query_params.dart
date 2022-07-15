class CommentQueryParameters {
  final String? postId;
  final String? id;
  final String? name;
  final String? email;
  final String? body;

  CommentQueryParameters(
      {this.postId, this.id, this.name, this.email, this.body});

  Map<String, String> toMap() {
    Map<String, String> map = {
      'postId': postId.toString(),
      'id': id.toString(),
      'name': name.toString(),
      'email': email.toString(),
      'body': body.toString()
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }
}