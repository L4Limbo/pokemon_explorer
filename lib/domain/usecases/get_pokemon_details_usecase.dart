import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_details.dart';
import 'package:pokemon_explorer/domain/repositories/pokemon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemon_details_usecase.g.dart';

@riverpod
GetPokemonDetailsUseCase getPokemonDetailUseCase(Ref ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);
  return GetPokemonDetailsUseCase(pokemonRepository);
}

class GetPokemonDetailsUseCase {
  GetPokemonDetailsUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Future<DataState<PokemonDetails>> getPokemon(String pokemonName) async {
    try {
      return await _pokemonRepository.getPokemon(pokemonName);
    } catch (e) {
      rethrow;
    }
  }
}
