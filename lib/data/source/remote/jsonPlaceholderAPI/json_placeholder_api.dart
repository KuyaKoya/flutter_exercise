import 'package:dio/dio.dart';
import 'package:flutter_exercise/core/network/network.dart';

class JsonPlaceHolderAPI {
  JsonPlaceHolderAPI();

  final NetworkManager networkManager = NetworkManager();

  static const String baseURL = "https://jsonplaceholder.typicode.com";

  Future<Response> request(RequestMethod requestMethod, String endpoint, Map<String, dynamic> queryParams) async {
    final response = await networkManager.request(
      requestMethod, 
      baseURL + endpoint, 
      queryParameters: queryParams);

    return response;
  }
}
