import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_explorer/domain/models/data_states/paginated_data_state.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/domain/repositories/pokemon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemons_by_type_usecase.g.dart';

@riverpod
GetPokemonsUseCase getPokemonsByTypeUseCase(Ref ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);
  return GetPokemonsUseCase(pokemonRepository);
}

class GetPokemonsUseCase {
  GetPokemonsUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Future<PaginatedDataState<List<Pokemon>>> getPokemonsByType(
    int limit,
    int nextPage,
    String type, {
    String? keyword,
  }) async {
    try {
      return await _pokemonRepository.getPokemonsByType(
        limit,
        nextPage,
        type,
        keyword: keyword,
      );
    } catch (e) {
      rethrow;
    }
  }
}
