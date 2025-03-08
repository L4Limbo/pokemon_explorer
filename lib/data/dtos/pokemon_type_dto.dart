import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';

part 'pokemon_type_dto.freezed.dart';
part 'pokemon_type_dto.g.dart';

@freezed
class PokemonTypeDto with _$PokemonTypeDto {
  const PokemonTypeDto._();

  factory PokemonTypeDto({
    @JsonKey(name: 'type') required String name,
  }) = _PokemonTypeDto;

  factory PokemonTypeDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeDtoFromJson(json);

  PokemonType toPokemonType() {
    return PokemonType(
      name: name,
    );
  }

  static PokemonTypeDto fromPokemonType(PokemonType type) {
    return PokemonTypeDto(
      name: type.name,
    );
  }

  static PokemonTypeDto fromApiResponse(Map<String, dynamic> json) {
    return PokemonTypeDto(
      name: json['type']['name'] as String,
    );
  }
}
