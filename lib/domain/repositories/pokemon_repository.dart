import 'package:pokemon_explorer/domain/models/data_states/data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/paginated_data_state.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_details.dart';

abstract class PokemonRepository {
  Future<PaginatedDataState<List<Pokemon>>> getPokemons(
      Map<String, dynamic> queryParameters);
  Future<PaginatedDataState<List<Pokemon>>> getPokemonsByType(
      int limit, int nextPage, String type);
  Future<DataState<PokemonDetails>> getPokemon(String pokemonName);
}
