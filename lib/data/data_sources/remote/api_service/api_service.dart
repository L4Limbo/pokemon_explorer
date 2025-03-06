import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/config/environment/app_env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service.g.dart';

@riverpod
ApiService apiService(Ref ref) {
  return ApiService();
}

class ApiService {
  final Dio _dio;

  ApiService() : _dio = Dio() {
    _dio.options.baseUrl = AppEnv().apiHost!;
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        _attachHeaders(options);
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.statusCode == 200 && response.data != null) {
          return handler.next(response);
        } else {
          return handler.reject(DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
            error:
                'Unexpected response: ${response.statusCode}, ${response.data}',
          ));
        }
      },
      onError: (DioException error, handler) {
        _handleDioException(error);
        return handler.next(error);
      },
    ));
  }

  void _attachHeaders(RequestOptions options) {
    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }

  String _handleDioException(DioException error) {
    String errorMessage;

    switch (error.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timeout with API server';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        errorMessage =
            'Received invalid status code: ${error.response?.statusCode}';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Unexpected error occurred: ${error.message}';
        break;
      case DioExceptionType.badCertificate:
        errorMessage = 'The server certificate is invalid or untrusted';
        break;
      case DioExceptionType.connectionError:
        errorMessage =
            'Failed to connect to the server. Check your internet connection';
        break;
    }

    throw DioException(
      requestOptions: error.requestOptions,
      response: error.response,
      type: error.type,
      error: errorMessage,
    );
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get('/api/$endpoint', queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }
}
