import 'package:dio/dio.dart';

import '../../constants/api_const.dart';
import '../../constants/app_const.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      receiveDataWhenStatusError: true,
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
      //  'lang': 'ar',
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
      //  'lang': 'ar',
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
      // 'lang': 'ar',
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
      //  'lang': 'ar',
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
      //  'lang': 'ar',
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
    required Object data,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': AppConstant.currentLanguage,
      // 'lang': 'ar',
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
      //  'lang': 'ar',
      'Authorization': token!,
      'Content-Type': 'application/json',
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
