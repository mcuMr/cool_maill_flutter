import 'package:core/network/err_code.dart';
import 'package:core/network/network_exception.dart';
import 'package:dio/dio.dart';

class DioClient {
  static const String baseUrl = 'https://mall.dusksnow.top/app/'; // 替换为你的实际 API 地址
  static const int connectTimeout = 3000; // 连接超时时间，单位毫秒
  static const int receiveTimeout = 3000; // 接收超时时间，单位毫秒
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static DioClient? _instance;
  late Dio _dio;
  late NetworkException _networkException;

  /// 私有构造方法
  DioClient._internal() {
    // 初始化 Dio
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(milliseconds: connectTimeout),
        receiveTimeout: Duration(milliseconds: receiveTimeout),
        headers: defaultHeaders,
        responseType: ResponseType.json,
      ),
    );

    // 初始化自定义网络异常
    _networkException = NetworkException(code: -999, msg: '未知错误');

    // 添加拦截器
    _addInterceptors();
  }

  void _addInterceptors() {
    // 2. 日志拦截器（开发环境开启，生产环境关闭）
    _dio.interceptors.add(
      LogInterceptor(
        request: true, // 是否打印请求日志
        requestBody: true, // 是否打印请求体
        responseBody: true, // 是否打印响应体
        responseHeader: true, // 是否打印响应头
        error: true, // 是否打印错误日志
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 在请求发送之前做一些处理
          String? token = "token"; // 从本地缓存获取 token
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options); // 继续请求
        },

        onResponse: (response, handler) {
          Map<String, dynamic> result = response.data;
          int code = result['code'] ?? -1;
          String msg = result['msg'] ?? '请求失败';

          if (code == ErrCode.SUCCESS) {
            response.data = result['data']; // 只返回 data 部分
            handler.next(response);
          }else {
            // 处理错误码
            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
                error: msg,
              ),
            );
          }
        },

        onError: (DioException e, handler) {
          // 在请求失败之前做一些处理
          NetworkException exception = _networkException.handleDioError(e);

          return handler.next(
            DioException(
              requestOptions: e.requestOptions,
              error: exception,
              type: e.type,
              message: exception.msg,
            ),
          );
        },
      ),
    );
  }

  /// 获取单例
  static DioClient get instance {
    _instance ??= DioClient._internal();
    return _instance!;
  }

    /// GET 请求
    Future<T> get<T>(
      String path, {
      Map<String, dynamic>? queryParameters,
    }) async {
      try {
        Response response = await _dio.get(
          path,
          queryParameters: queryParameters,
        );
        
        var result = response.data['data'] as T; // 只返回 data 部分

        return result;
      } on DioException catch (e) {
        throw _networkException.handleDioError(e);
      }
    }

    /// POST 请求
    Future<T> post<T>(
      String path, {
      dynamic data,
      Map<String, dynamic>? queryParameters,
    }) async {
      try {
        Response response = await _dio.post(
          path,
          data: data,
          queryParameters: queryParameters,
        );
        var result = response.data['data'] as T; // 只返回 data 部分
        return result;
      } on DioException catch (e) {
        throw _networkException.handleDioError(e);  
      }
    }
}
