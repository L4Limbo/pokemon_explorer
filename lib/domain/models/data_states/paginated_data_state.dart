import 'package:pokemon_explorer/domain/models/data_states/data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/pagination_meta.dart';

class PaginatedDataState<T> extends DataState<T> {
  final PaginationMeta? meta;

  const PaginatedDataState({super.data, this.meta, super.error});
}
