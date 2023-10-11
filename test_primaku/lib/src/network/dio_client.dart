import 'package:dio/dio.dart';

// ignore: constant_identifier_names
enum NetworkRequestType { GET, POST, PUT, PATCH, DELETE }

class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = 'https://reqres.in/api';

  void configureDio() {
    // Set default configs
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Future<Response> request(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    NetworkRequestType? requestType,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.request(_baseUrl + path,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          options: Options(
            method: NetworkRequestType.GET.name,
          ),
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
