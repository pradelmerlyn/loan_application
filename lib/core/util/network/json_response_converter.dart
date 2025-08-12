import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

class JsonResponseConverter extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('-- response --');
    debugPrint("realUri: ${response.realUri}");
    debugPrint("response.realUri.toString(): ${response.realUri.toString()}");
    debugPrint("statusCode: ${response.statusCode}");
    debugPrint("statusMessage: ${response.statusMessage}");
    debugPrint("isRedirect: ${response.isRedirect}");
    debugPrint("response.data.runtimeType: ${response.data.runtimeType}");
    debugPrint(jsonEncode(response.data));

    debugPrint('--  --');
    // response.data = json.decode(response.data);
    super.onResponse(response, handler);
  }
}
