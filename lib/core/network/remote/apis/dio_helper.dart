import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../end_points.dart';
import 'dio_interceptors.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        followRedirects: false,
        receiveDataWhenStatusError: true,
        validateStatus: (status) => status! < 500,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
    dio!.options.headers = {'Content-Type': 'application/json'};
    dio!.interceptors.addAll({
      AppInterceptors(dio!),
      // LogInterceptor(requestBody: true, responseBody: true)
      if (kDebugMode)
        PrettyDioLogger(
          error: true,
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: false,
          responseHeader: false,
        ),
    });
  }

  /// METHOD [POST] DATA FROM API
  // static Future<Response> post({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   Map<String, dynamic>? headers,
  //   data,
  // }) async {
  //   dio!.options.headers = headers ?? {'Content-Type': 'application/json'};
  //   return await dio!.post(url, data: data, queryParameters: query);
  // }

  static Future<Response> post({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    dio!.options.headers = headers ??
        {
          'Content-Type':
              data is FormData ? 'multipart/form-data' : 'application/json',
        };

    return await dio!.post(url, data: data, queryParameters: query);
  }

  /// METHOD [GET] DATA FROM API
  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
    data,
  }) async {
    return await dio!.get(url, queryParameters: query, data: data);
  }

  /// METHOD [DELETE] DATA FROM API
  static Future<Response> delete({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    dio!.options.headers = headers ?? {'Content-Type': 'application/json'};
    return await dio!.delete(url, data: data, queryParameters: query);
  }

  /// METHOD [PATCH] UPDATE DATA ON API
  static Future<Response> patch({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    dio!.options.headers = headers ?? {'Content-Type': 'application/json'};
    return await dio!.patch(url, data: data, queryParameters: query);
  }

  /// METHOD [PUT] UPDATE DATA ON API
  static Future<Response> put({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    return await dio!.put(url, data: data, queryParameters: query);
  }

  /// METHOD [DOWNLOAD] FILE FROM API
  static Future<void> download({
    required String url,
    required String savePath,
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio!.options.headers = headers ?? {'Content-Type': 'application/json'};
      await dio!.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      throw Exception('Download failed: $e');
    }
  }
}
