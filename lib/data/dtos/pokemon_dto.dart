import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';

part 'pokemon_dto.freezed.dart';
part 'pokemon_dto.g.dart';

@freezed
class PokemonDto with _$PokemonDto {
  const PokemonDto._();

  factory PokemonDto({
    required String name,
    String? imagePath,
  }) = _PokemonDto;

  factory PokemonDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonDtoFromJson(json);

  Pokemon toPokemon() {
    return Pokemon(
      name: name,
      imagePath: imagePath,
    );
  }

  static PokemonDto fromPokemon(Pokemon pokemon) {
    return PokemonDto(
      name: pokemon.name,
      imagePath: pokemon.imagePath,
    );
  }
}

extension PokemonDtoX on PokemonDto {
  static PokemonDto fromApiResponse(Map<String, dynamic> json) {
    return PokemonDto(
      name: json['name'] as String,
      imagePath: json['sprites']?['front_default'] as String?,
    );
  }
}
