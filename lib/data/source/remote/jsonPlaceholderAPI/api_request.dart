import 'package:dio/dio.dart';
import 'package:flutter_exercise/core/network/network.dart';

class ApiRequest {
  ApiRequest(this.baseURL);

  final NetworkManager networkManager = NetworkManager();

  final String baseURL;

  Future<Response> request(RequestMethod requestMethod, String endpoint, Map<String, dynamic> queryParams) async {
    final response = await networkManager.request(
      requestMethod, 
      baseURL + endpoint, 
      queryParameters: queryParams);

    return response;
  }

}
