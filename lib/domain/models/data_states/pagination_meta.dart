import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_meta.freezed.dart';

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int count,
    String? next,
    String? previous,
  }) = _PaginationMeta;
}
