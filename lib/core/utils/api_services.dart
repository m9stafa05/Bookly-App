import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  const ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPinot}) async {
    var response = await _dio.get("$_baseUrl$endPinot");
    return response.data;
  }
}
