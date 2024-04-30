import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gado_certo_todo_list/shared/config/globals.dart';

class ApiService {
  static Dio get dio => _dio;

  static final Dio _dio = Dio(
    BaseOptions(
      contentType: ContentType.json.value,
      baseUrl: 'https://gc-api-todo.vercel.app/jeferson-gazzola',
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
}
