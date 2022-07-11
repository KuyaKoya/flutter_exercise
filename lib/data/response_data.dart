import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

abstract class ResponseData<T>  {
  ResponseData.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();

}
