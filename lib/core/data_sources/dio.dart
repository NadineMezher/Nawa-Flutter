import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;
  Dio get getDio => _dio;

  void init() {
    _dio = Dio(
      BaseOptions(
        // baseUrl: ApiConstants.BASE_URL_SERVER,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            "Content-Type": "application/json",
            "accept": "application/json",
            "x-device-id": "Abc123",
            "X-CSRF-TOKEN": "",
          }),
    );
    // _dio.interceptors.add(BaseUrlInterceptor());
    _dio.interceptors.add(Logging());
  }

// GET Request
  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(url, queryParameters: params);
      return response;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

// POST Request
  Future<Response> post(String url, {Map<String, dynamic>? data,Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.post(url, data: data,queryParameters: params);
      return response;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // Private Error Handling Method
  Response _handleError(DioException e) {
    print('Dio Error: ${e.message}');
    throw Exception("Network Error: ${e.response?.statusCode} ${e.message}");
  }
}

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    print('QUERY[${options.queryParameters}] => PATH: ${options.path}');
    print('BODY[${options.data}] => PATH: ${options.path}');

    print('HEADERS[${options.headers}]');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => DATA: ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
      'Error[${err.response?.statusCode}] => DATA: ${err.response?.data}',
    );
  }
}
