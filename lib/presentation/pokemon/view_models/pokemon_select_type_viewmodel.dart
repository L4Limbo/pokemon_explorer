import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';
import 'package:pokemon_explorer/domain/services/pokemon_type_service.dart';
import 'package:pokemon_explorer/presentation/pokemon/states/pokemon_select_type_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_select_type_viewmodel.g.dart';

@riverpod
class PokemonSelectTypeViewModel extends _$PokemonSelectTypeViewModel {
  PokemonType? _selectedPokemonType;

  @override
  PokemonSelectTypeState build() {
    return PokemonSelectTypeState(
      ref.read(pokemonTypeServiceProvider),
      selectedPokemonType: _selectedPokemonType,
    );
  }

  void selectPokemonType(PokemonType? pokemonType) {
    _selectedPokemonType = pokemonType;
    state = state.copyWith(selectedPokemonType: pokemonType);
  }
}
