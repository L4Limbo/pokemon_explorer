import 'package:dio/dio.dart';
import 'package:pokemon_explorer/config/environment/app_env.dart';

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
        handler.next(response);
      },
    ));
  }

  void _attachHeaders(RequestOptions options) {
    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }

  Future<Response> _request(String method, String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response;

      switch (method) {
        case 'GET':
          response = await _dio.get('/api/$endpoint',
              queryParameters: queryParameters);
          break;
        default:
          throw UnsupportedError('HTTP method not supported');
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    return _request('GET', endpoint, queryParameters: queryParameters);
  }
}
