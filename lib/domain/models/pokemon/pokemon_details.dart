import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_explorer/domain/models/pokemon/basic_stat.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';

part 'pokemon_details.freezed.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  const factory PokemonDetails({
    required Pokemon pokemon,
    required List<BasicStat> basicStats,
    required List<PokemonType> types,
  }) = _PokemonDetails;
}
