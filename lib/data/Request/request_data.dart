abstract class RequestData {
  String url = 'jsonplaceholder.typicode.com';
  Uri parseToURL();
  Map<String, dynamic> toMap();
}
