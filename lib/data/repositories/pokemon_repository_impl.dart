import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/data/data_sources/remote/pokemon/pokemon_api_service.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state_types.dart';
import 'package:pokemon_explorer/domain/models/data_states/paginated_data_state.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_details.dart';
import 'package:pokemon_explorer/domain/repositories/pokemon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_repository_impl.g.dart';

@riverpod
PokemonRepository pokemonRepository(Ref ref) {
  final pokemonApiService = ref.watch(pokemonApiServiceProvider);
  return PokemonRepositoryImpl(pokemonApiService);
}

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._pokemonApiService);

  final PokemonApiService _pokemonApiService;

  @override
  Future<DataState<PokemonDetails>> getPokemon(String pokemonName) async {
    try {
      final result = await _pokemonApiService.getPokemon(pokemonName);

      if (result is DataSuccess) {
        final pokemon = result.data!.toPokemonDetails();
        return DataSuccess(pokemon);
      } else if (result is DataFailed) {
        return DataFailed(result.error!);
      }

      throw Exception('Unknown data state');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PaginatedDataState<List<Pokemon>>> getPokemons(
      Map<String, dynamic> queryParameters) async {
    try {
      final result = await _pokemonApiService.getPokemons(queryParameters);

      if (result is PaginatedDataSuccess) {
        final pokemons = result.data!.map((dto) => dto.toPokemon()).toList();
        return PaginatedDataSuccess(pokemons, result.meta!);
      } else if (result is DataFailed) {
        return PaginatedDataFailed(result.error!);
      }

      throw Exception('Unknown data state');
    } catch (e) {
      rethrow;
    }
  }
}
