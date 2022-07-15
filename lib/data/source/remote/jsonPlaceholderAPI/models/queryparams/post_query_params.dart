class PostQueryParameters {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Map<String, String> toMap() {
    Map<String, String> map = {
      'userId': userId.toString(),
      'id': id.toString(),
      'title': title.toString(),
      'body': body.toString()
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }

  PostQueryParameters({this.userId, this.id, this.title, this.body});
}
