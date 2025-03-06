import 'package:pokemon_explorer/data/data_sources/remote/pokemon/pokemon_api_service.dart';
import 'package:pokemon_explorer/data/dtos/pokemon_dto.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state_types.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_details.dart';
import 'package:pokemon_explorer/domain/repositories/pokemon_repository.dart';

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
  Future<DataState<List<Pokemon>>> getPokemons(
      Map<String, dynamic> queryParameters) async {
    try {
      final result = await _pokemonApiService.getPokemons(queryParameters);

      if (result is DataSuccess) {
        final pokemons = result.data!.map((dto) => dto.toPokemon()).toList();
        return DataSuccess(pokemons);
      } else if (result is DataFailed) {
        return DataFailed(result.error!);
      }

      throw Exception('Unknown data state');
    } catch (e) {
      rethrow;
    }
  }
}
