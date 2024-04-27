import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  static Dio get dio => _dio;

  static final Dio _dio = Dio(
    BaseOptions(
      contentType: ContentType.json.value,
      baseUrl: 'https://api01.flowch.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          loadingBarService.start();
          handler.next(options);
        },
        onResponse: (response, handler) async {
          loadingBarService.stop();
          handler.next(response);
        },
        onError: (error, handler) async {
          loadingBarService.stop();
        },
      ),
    );

  static Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) =>
      _dio.get(
        path,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

  static Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) =>
      _dio.post(
        path,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );

  static Future<Response> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) =>
      _dio.put(
        path,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );

  static Future<Response> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) =>
      _dio.delete(
        path,
        cancelToken: cancelToken,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );

  static Future<Response> download(
    String urlPath,
    dynamic savePath, {
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) =>
      _dio.download(
        urlPath,
        savePath,
        cancelToken: cancelToken,
        data: data,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );
}
