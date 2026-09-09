import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final int code; // 错误码（业务码/HTTP状态码/系统码）
  final String msg; // 错误信息

    NetworkException({required this.code, required this.msg});


  @override
  String toString() => 'NetworkException(code: $code, msg: $msg)';


  /// 将 Dio 错误转换为自定义网络异常
    NetworkException handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return NetworkException(code: -1, msg: '请求超时，请检查网络');
    } else if (e.type == DioExceptionType.connectionError) {
      return NetworkException(code: -2, msg: '网络连接失败，请检查网络');
    } else if (e.type == DioExceptionType.badResponse) {
      // HTTP 状态码错误（404、500 等）
      int statusCode = e.response?.statusCode ?? -3;
      return NetworkException(code: statusCode, msg: '服务器错误（$statusCode）');
    } else if (e.error is NetworkException) {
      // 业务错误（已在响应拦截器抛出）
      return e.error as NetworkException;
    } else {
      return NetworkException(code: -999, msg: '未知错误：${e.message}');
    }
  }

}