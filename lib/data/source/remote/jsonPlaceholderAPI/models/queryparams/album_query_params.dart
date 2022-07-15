class AlbumQueryParams {
  final int? id;
  final int? userId;
  final String? title;

  Map<String, String> toMap() {
    Map<String, String> map = {
      'id': id.toString(),
      'userId': userId.toString(),
      'title': title.toString(),
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }

  AlbumQueryParams({this.id, this.userId, this.title});
}
