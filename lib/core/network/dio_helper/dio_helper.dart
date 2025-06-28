import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../constants/api_const.dart';
import '../../constants/app_const.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      receiveDataWhenStatusError: true,
    ));

    // Manual interceptor
    dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint("🚀 REQUEST:");
        debugPrint("- URL: ${options.baseUrl}${options.path}");
        debugPrint("- METHOD: ${options.method}");
        debugPrint("- HEADERS: ${options.headers}");
        debugPrint("- QUERY PARAMS: ${options.queryParameters}");
        debugPrint("- BODY: ${options.data}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint("✅ RESPONSE:");
        debugPrint("- STATUS CODE: ${response.statusCode}");
        debugPrint("- DATA: ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        debugPrint("❌ ERROR:");
        debugPrint("- MESSAGE: ${e.message}");
        if (e.response != null) {
          debugPrint("- STATUS CODE: ${e.response?.statusCode}");
          debugPrint("- DATA: ${e.response?.data}");
        }
        return handler.next(e);
      },
    ));

    // Pretty logger
    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': AppConstant.currentLanguage,
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    return await dio!.get(
      url,
      queryParameters: query,
      data: body,
    );
  }

  static Future<Response> getDataWithoutToken({
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': AppConstant.currentLanguage,
      'Content-Type': 'application/json',
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Object data,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': AppConstant.currentLanguage,
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? query,
    required Object data,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': AppConstant.currentLanguage,
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    return await dio!.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': AppConstant.currentLanguage,
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    return await dio!.delete(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postDataWithoutToken({
    required String url,
    Map<String, dynamic>? query,
    Object? data,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': AppConstant.currentLanguage,
      'Authorization': token == null ? '' : 'Bearer $token',
      'Content-Type': 'application/json',
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': AppConstant.currentLanguage,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
