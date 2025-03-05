import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_stat.freezed.dart';

@freezed
class BasicStat with _$BasicStat {
  const factory BasicStat({
    required int value,
    required String name,
  }) = _BasicStat;
}
