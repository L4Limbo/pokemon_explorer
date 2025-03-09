import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/data/data_sources/remote/pokemon/pokemon_api_service.dart';
import 'package:pokemon_explorer/data/dtos/pokemon_dto.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state_types.dart';
import 'package:pokemon_explorer/domain/models/data_states/paginated_data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/pagination_meta.dart';
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
      } else if (result is PaginatedDataFailed) {
        return PaginatedDataFailed(result.error!);
      }

      throw Exception('Unknown data state');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PaginatedDataState<List<Pokemon>>> getPokemonsByType(
      int limit, int nextPage, String type,
      {String? keyword}) async {
    try {
      final result = await _pokemonApiService.getPokemonsByType(type);
      if (result is DataSuccess) {
        int offset = _getOffsetFromCurrentPage(nextPage, limit);
        if (offset >= result.data!.length) {
          return PaginatedDataSuccess(
            [],
            PaginationMeta(
              count: result.data!.length,
              next: null,
            ),
          );
        }

        List<Pokemon> pokemons = [];

        List<PokemonDto> pokemonsFiltered =
            _normalizeFilterAndSearch(result, keyword);

        if (pokemonsFiltered.length < offset) {
          return PaginatedDataSuccess(
            pokemons,
            PaginationMeta(
              count: pokemonsFiltered.length,
              next: offset <= pokemonsFiltered.length ? '' : null,
            ),
          );
        } else if (pokemonsFiltered.length > limit) {
          pokemons = pokemonsFiltered
              .sublist(
                  offset,
                  offset + limit > pokemonsFiltered.length
                      ? null
                      : offset + limit)
              .toList()
              .map((dto) => dto.toPokemon())
              .toList();
        } else {
          pokemons = pokemonsFiltered.map((dto) => dto.toPokemon()).toList();
        }

        return PaginatedDataSuccess(
          pokemons,
          PaginationMeta(
            count: pokemonsFiltered.length,
            next: offset <= pokemonsFiltered.length ? '' : null,
          ),
        );
      } else if (result is DataFailed) {
        return PaginatedDataFailed(result.error!);
      }

      throw Exception('Unknown data state');
    } catch (e) {
      rethrow;
    }
  }

  List<PokemonDto> _normalizeFilterAndSearch(
      DataState<List<PokemonDto>> result, String? keyword) {
    return result.data!.where((e) {
      var processedKeyword =
          (keyword ?? '').replaceAll(RegExp(r'\s+'), ' ').trim();

      var words = processedKeyword.split(' ');

      return words
          .every((word) => e.name.toLowerCase().contains(word.toLowerCase()));
    }).toList();
  }

  int _getOffsetFromCurrentPage(int currentPage, int limit) {
    return (currentPage - 1) * limit;
  }
}
