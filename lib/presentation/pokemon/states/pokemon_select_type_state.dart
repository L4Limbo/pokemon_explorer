import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';

part 'pokemon_select_type_state.freezed.dart';

@freezed
class PokemonSelectTypeState with _$PokemonSelectTypeState {
  const factory PokemonSelectTypeState(
    List<PokemonType> pokemonTypes, {
    PokemonType? selectedPokemonType,
  }) = _Success;
}
