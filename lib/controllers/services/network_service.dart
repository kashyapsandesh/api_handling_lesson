import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpServices {
//initilized dio
  Dio? _dio;
//create class constructor
  HttpServices() {
    _dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
    inspector();
  }

  //method handled by dio
  Future<Response> getRequest(String endpoint) async {
    Response? res;
    try {
      res = await _dio!.get(endpoint);
      if (res.data != null) {
        log("Response is: ${jsonEncode(res.data)}");
      } else {
        log("Response is Null");
      }
    } on DioException catch (e) {
      log("Dio Error:${e.message}");
      throw Exception(e.message);
    }
    return res;
  }

  //post post
   Future<Response> postRequest(String endpoint, {required Map<String, dynamic> data}) async {
    Response? res;
    try {
      res = await _dio!.post(endpoint, data: data);
      if (res.data != null) {
        log("Response is: ${jsonEncode(res.data)}");
      } else {
        log("Response is Null");
      }
    } on DioError catch (e) {
      log("Dio Error:${e.message}");
      throw Exception(e.message);
    }
    return res!;
  }

//use pretty dio logger
  inspector() {
    _dio!.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }
}
