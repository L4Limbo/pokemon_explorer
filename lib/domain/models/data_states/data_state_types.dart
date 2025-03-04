import 'package:dio/dio.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/paginated_data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/pagination_meta.dart';

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}

class PaginatedDataSuccess<T> extends PaginatedDataState<T> {
  const PaginatedDataSuccess(T data, PaginationMeta meta)
      : super(data: data, meta: meta);
}

class PaginatedDataFailed<T> extends PaginatedDataState<T> {
  const PaginatedDataFailed(DioException error) : super(error: error);
}
