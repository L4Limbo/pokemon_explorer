import 'package:pokemon_explorer/domain/models/data_states/data_state.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_details.dart';

abstract class PokemonRepository {
  Future<DataState<List<Pokemon>>> getPokemons(
      Map<String, dynamic> queryParameters);
  Future<DataState<PokemonDetails>> getPokemon(String pokemonName);
}
