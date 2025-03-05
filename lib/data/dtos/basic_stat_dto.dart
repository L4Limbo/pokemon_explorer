import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_explorer/domain/models/pokemon/basic_stat.dart';

part 'basic_stat_dto.freezed.dart';
part 'basic_stat_dto.g.dart';

@freezed
class BasicStatDto with _$BasicStatDto {
  const BasicStatDto._();

  factory BasicStatDto({
    required int value,
    required String name,
  }) = _BasicStatDto;

  factory BasicStatDto.fromJson(Map<String, dynamic> json) =>
      _$BasicStatDtoFromJson(json);

  BasicStat toBasicStat() {
    return BasicStat(
      value: value,
      name: name,
    );
  }

  static BasicStatDto fromBasicStat(BasicStat stat) {
    return BasicStatDto(
      value: stat.value,
      name: stat.name,
    );
  }
}
