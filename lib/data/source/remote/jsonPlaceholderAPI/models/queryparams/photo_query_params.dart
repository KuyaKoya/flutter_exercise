class PhotoQueryParams {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  PhotoQueryParams(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Map<String, String> toMap() {
    Map<String, String> map = {
      'albumId': albumId.toString(),
      'id': id.toString(),
      'title': title.toString(),
      'url': url.toString(),
      'thumbnailUrl': thumbnailUrl.toString()
    };
    map.removeWhere((key, value) => value == 'null');
    return map;
  }
}
