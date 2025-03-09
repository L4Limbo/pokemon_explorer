import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pokemon_explorer/config/environment/app_env.dart';
import 'package:pokemon_explorer/utils/constants.dart';

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
            error: ErrorMessages.unexpectedError,
            message: ErrorMessages.unexpectedError,
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
    String errorMessage = ErrorMessages.unexpectedError;

    switch (error.type) {
      case DioExceptionType.cancel:
        errorMessage = ErrorMessages.requestCancelled;
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = ErrorMessages.connectionTimeout;
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = ErrorMessages.sendTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = ErrorMessages.receiveTimeout;
        break;
      case DioExceptionType.badResponse:
        errorMessage = ErrorMessages.badResponse;
        break;
      case DioExceptionType.unknown:
        errorMessage = ErrorMessages.unexpectedError;
        break;
      case DioExceptionType.badCertificate:
        errorMessage = ErrorMessages.badCertificate;
        break;
      case DioExceptionType.connectionError:
        errorMessage = ErrorMessages.connectionError;
        break;
    }

    throw DioException(
      requestOptions: error.requestOptions,
      response: error.response,
      type: error.type,
      error: errorMessage,
      message: errorMessage,
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
