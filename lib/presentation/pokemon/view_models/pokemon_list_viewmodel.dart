import 'dart:async';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state_types.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_list_filter.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';
import 'package:pokemon_explorer/domain/services/pokemon_type_service.dart';
import 'package:pokemon_explorer/domain/usecases/get_pokemons_by_type_usecase.dart';
import 'package:pokemon_explorer/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokemon_explorer/presentation/pokemon/states/pokemon_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_list_viewmodel.g.dart';

@riverpod
class PokemonListViewModel extends _$PokemonListViewModel {
  final _pagingController = PagingController<int, Pokemon>(firstPageKey: 1);
  PokemonListFilter _pokemonListFilter = PokemonListFilter();
  final _limit = 10;

  @override
  PokemonListState build() {
    _init();

    return PokemonListState(
      pagingController: _pagingController,
      pokemonListFilter: _pokemonListFilter,
    );
  }

  void _init() {
    _pagingController.addPageRequestListener((_) => _getPokemons());
  }

  Map<String, dynamic> _filters() {
    Map<String, dynamic> filters = {
      'offset':
          _getOffsetFromCurrentPage(_pagingController.nextPageKey!, _limit),
      'limit': _limit,
    };

    return filters;
  }

  Future<void> _getPokemons() async {
    if (_pokemonListFilter.pokemonType != null) {
      _fetchPokemonsByType();
    } else {
      _fetchPokemons();
    }
  }

  Future<void> _fetchPokemons() async {
    try {
      final result =
          await ref.read(getPokemonsUseCaseProvider).getPokemons(_filters());

      if (result is PaginatedDataSuccess<List<Pokemon>>) {
        _updateData(result);
      } else if (result is PaginatedDataFailed<List<Pokemon>>) {
        _setError(result.error!.response!.statusCode.toString());
      } else {
        _setError('Unknown error occurred');
      }
    } catch (e) {
      _pagingController.error = e;
    }

    state = state.copyWith(pagingController: _pagingController);
  }

  Future<void> _fetchPokemonsByType() async {
    try {
      final result =
          await ref.read(getPokemonsByTypeUseCaseProvider).getPokemonsByType(
                _limit,
                _pagingController.nextPageKey!,
                _pokemonListFilter.pokemonType!.name,
                keyword: _pokemonListFilter.pokemonName,
              );
      if (result is PaginatedDataSuccess<List<Pokemon>>) {
        _updateData(result);
      } else if (result is PaginatedDataFailed<List<Pokemon>>) {
        _setError(result.error!.response!.statusCode.toString());
      } else {
        _setError('Unknown error occurred');
      }
    } catch (e) {
      _pagingController.error = e;
    }

    state = state.copyWith(pagingController: _pagingController);
  }

  void updateSelectedPokemonType(PokemonType? pokemonType) {
    _pokemonListFilter = _pokemonListFilter.copyWith(pokemonType: pokemonType);
    state = state.copyWith(
        pokemonListFilter:
            _pokemonListFilter.copyWith(pokemonType: pokemonType));
  }

  void updatePokemonSearchName(String? pokemonName) {
    _pokemonListFilter = _pokemonListFilter.copyWith(pokemonName: pokemonName);

    state = state.copyWith(
      pokemonListFilter: _pokemonListFilter.copyWith(pokemonName: pokemonName),
    );
  }

  void _setError(String error) {
    _pagingController.error = error;
  }

  void _updateData(PaginatedDataSuccess<List<Pokemon>> result) {
    if (result.meta!.next != null) {
      _pagingController.appendPage(
          result.data!, _pagingController.nextPageKey! + 1);
    } else {
      _pagingController.appendLastPage(result.data!);
    }
  }

  void getData() {
    _pagingController.refresh();
  }

  int _getOffsetFromCurrentPage(int currentPage, int limit) {
    return (currentPage - 1) * limit;
  }
}
