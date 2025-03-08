import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';

part 'pokemon_list_filter.freezed.dart';

@freezed
class PokemonListFilter with _$PokemonListFilter {
  const factory PokemonListFilter({
    PokemonType? pokemonType,
    String? pokemonName,
  }) = _PokemonListFilter;
}
