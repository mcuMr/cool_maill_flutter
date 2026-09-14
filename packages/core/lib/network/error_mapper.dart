import 'package:core/network/network_exception.dart';
import 'package:dio/dio.dart';

class ErrorMapper {
  static NetworkException map(Object error) {
    if (error is NetworkException) return error;
    if (error is DioException) return fromDio(error);
    return NetworkException(code: -999, msg: '未知错误：$error');
  }

  static NetworkException fromDio(DioException e) {
    if (e.error is NetworkException) {
      return e.error as NetworkException;
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return const NetworkException(code: -1, msg: '请求超时，请检查网络');
    }
    if (e.type == DioExceptionType.connectionError) {
      return const NetworkException(code: -2, msg: '网络连接失败，请检查网络');
    }
    if (e.type == DioExceptionType.cancel) {
      return const NetworkException(code: -4, msg: '请求已取消');
    }
    if (e.type == DioExceptionType.badResponse) {
      final statusCode = e.response?.statusCode ?? -3;
      return NetworkException(code: statusCode, msg: '服务器错误（$statusCode）');
    }
    return NetworkException(code: -999, msg: '未知错误：${e.message}');
  }
}
