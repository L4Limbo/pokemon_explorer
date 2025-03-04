import 'package:dio/dio.dart';

class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}
