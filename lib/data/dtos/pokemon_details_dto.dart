import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_explorer/data/dtos/basic_stat_dto.dart';
import 'package:pokemon_explorer/data/dtos/pokemon_dto.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_details.dart';

part 'pokemon_details_dto.freezed.dart';
part 'pokemon_details_dto.g.dart';

@freezed
class PokemonDetailsDto with _$PokemonDetailsDto {
  const PokemonDetailsDto._();

  factory PokemonDetailsDto({
    required PokemonDto pokemon,
    required List<BasicStatDto> basicStats,
  }) = _PokemonDetailsDto;

  factory PokemonDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsDtoFromJson(json);

  PokemonDetails toPokemonDetails() {
    return PokemonDetails(
      pokemon: pokemon.toPokemon(),
      basicStats: basicStats.map((stat) => stat.toBasicStat()).toList(),
    );
  }

  /// Converts domain model to DTO
  static PokemonDetailsDto fromPokemonDetails(PokemonDetails details) {
    return PokemonDetailsDto(
      pokemon: PokemonDto.fromPokemon(details.pokemon),
      basicStats: details.basicStats.map(BasicStatDto.fromBasicStat).toList(),
    );
  }
}
