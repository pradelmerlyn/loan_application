import 'dart:developer';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loan/core/util/network/json_response_converter.dart';

class DioInstance {
  static Dio init({
    bool requireAuth = true,
    bool isExternalRequest = false,
    bool bypassRefreshToken = false,
    bool implementTimeout = false,
    ResponseType? responseType = ResponseType.json,
    String? token = 'c8cdebbd255f6e5e17b048e6d8c1eff5cbfb3f175be9d35ca1d6fedfcc1388fe',
  }) {
    if (bypassRefreshToken) {
      assert(token != null);
    }
    log('DioInstance.init() implementTimeout: $implementTimeout');
    Dio dio = Dio();
    dio.options = implementTimeout
        ? BaseOptions(
            connectTimeout: const Duration(minutes: 3),
            receiveTimeout: const Duration(minutes: 3),
            sendTimeout: const Duration(minutes: 3),
            responseType: responseType,
          )
        : BaseOptions(
            connectTimeout: const Duration(minutes: 5),
            receiveTimeout: const Duration(minutes: 5),
            sendTimeout: const Duration(minutes: 10),
            responseType: responseType,
          );
    dio.interceptors.addAll([
      interceptorsWrapper(isExternalRequest, bypassRefreshToken, token: token),
      JsonResponseConverter(),
    ]);

    return dio;
  }

  static InterceptorsWrapper interceptorsWrapper(
    bool isExternalRequest,
    bool bypassRefreshToken, {
    String? token,
  }) => InterceptorsWrapper(
    onRequest: (options, handler) {
      debugPrint('-- onRequest interceptor --');
      debugPrint('options.baseUrl: ${options.baseUrl}');
      debugPrint('options.uri: ${options.uri}');
      debugPrint('options.path: ${options.path}');
      debugPrint('options.method: ${options.method}');
      debugPrint(
        'options.queryParameters: ${options.queryParameters.toString()}',
      );
      debugPrint('options.headers: ${options.headers.toString()}');
      debugPrint('-- 🍎🍎🍎🍎🍎🍎 --');
      //debugPrint('options.data: ${options.data.toString()}');
      // final jsonStr =
      //         const JsonEncoder.withIndent('  ').convert(options.data);
      //     print(jsonStr); // full pretty-printed JSON
      debugPrint('--  --');
      _requestInterceptor(
        options,
        handler,
        isExternalRequest,
        bypassRefreshToken,
        token: token,
      );
    },
    onError: (error, handler) =>
        _errorInterceptor(error, handler, bypassRefreshToken),
  );

  static Future<void> _requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
    bool isExternalRequest,
    bool bypassRefreshToken, {
    String? token,
  }) async {
    debugPrint('-- _requestInterceptor --');

    // Base content negotiation
    options.headers['Accept'] = 'application/json';
    options.contentType = 'application/json';

    // auth header token
    if (token != null && token.isNotEmpty) {
      options.headers['X-API-KEY'] = token;
    }

    debugPrint(options.headers.toString());
    debugPrint('--  --');
    return handler.next(options);
  }

  static Future<void> _errorInterceptor(
    DioException error,
    ErrorInterceptorHandler handler,
    bool bypassRefreshToken,
  ) async {
    debugPrint("_errorInterceptor error: ${error.requestOptions.uri}");
    debugPrint("_errorInterceptor error: ${error.message}");

    handler.next(error);
  }
}
