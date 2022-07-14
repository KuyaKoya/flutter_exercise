import 'package:dio/dio.dart';
import 'package:flutter_exercise/core/network/network.dart';

class ApiRequest {
  ApiRequest(this.networkManager);

  final NetworkManager networkManager;

  Future<Response> request(
    RequestMethod requestMethod, 
    String endpoint,
    Map<String, dynamic> queryParams, 
    String baseURL) async {

    Response<String> response = await networkManager.request(
        requestMethod, baseURL + endpoint,
        queryParameters: queryParams);

    return response;
  }
}
