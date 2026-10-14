import 'package:core/network/err_code.dart';
import 'package:core/network/error_mapper.dart';
import 'package:core/network/network_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://mall.dusksnow.top/app/',
  );
  static const int connectTimeout = 10000;
  static const int receiveTimeout = 15000;
  static const int sendTimeout = 15000;

  static DioClient? _instance;
  late final Dio _dio;

  Dio getDio() => _dio;

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: connectTimeout),
        receiveTimeout: const Duration(milliseconds: receiveTimeout),
        sendTimeout: const Duration(milliseconds: sendTimeout),
        // 不写死 Content-Type，避免 FormData 上传被覆盖成 application/json
        headers: const {
          'Accept': 'application/json',
        },
        responseType: ResponseType.json,
      ),
    );

    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.data is FormData) {
            options.headers.remove(Headers.contentTypeHeader);
          }

          String? token = "token"; // 从本地缓存获取 token
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          final data = response.data;
          if (data is! Map) {
            return handler.next(response);
          }

          final result = Map<String, dynamic>.from(data);
          if (!result.containsKey('code')) {
            return handler.next(response);
          }

          final code = result['code'] ?? -1;
          final msg = result['msg'] ?? result['message'] ?? '请求失败';

          if (code == ErrCode.SUCCESS) {
            return handler.next(response);
          }

          return handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              response: response,
              type: DioExceptionType.badResponse,
              error: NetworkException(code: code, msg: msg),
              message: msg.toString(),
            ),
          );
        },
        onError: (DioException e, handler) {
          if (e.error is NetworkException) {
            return handler.next(e);
          }

          final exception = ErrorMapper.fromDio(e);
          return handler.next(
            DioException(
              requestOptions: e.requestOptions,
              response: e.response,
              type: e.type,
              error: exception,
              message: exception.msg,
            ),
          );
        },
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
        ),
      );
    }
  }

  static DioClient get instance {
    _instance ??= DioClient._internal();
    return _instance!;
  }
}
