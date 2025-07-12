import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;

  const ApiServices(this.dio);

  Future<Map<String, dynamic>> get({required String endPinot}) async {
    var response = await dio.get("$_baseUrl$endPinot");
    return response.data;
  }
}
