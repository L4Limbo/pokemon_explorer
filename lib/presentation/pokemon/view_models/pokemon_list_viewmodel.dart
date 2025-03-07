import 'dart:async';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state_types.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokemon_explorer/presentation/pokemon/states/pokemon_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_list_viewmodel.g.dart';

@riverpod
class PokemonListViewModel extends _$PokemonListViewModel {
  final _pagingController = PagingController<int, Pokemon>(firstPageKey: 1);
  final _limit = 10;

  @override
  PokemonListState build() {
    _init();

    return PokemonListState(
      pagingController: _pagingController,
    );
  }

  void _init() {
    _pagingController.addPageRequestListener((_) => _fetchPokemons());
  }

  Map<String, dynamic> _filters() {
    Map<String, dynamic> filters = {
      'offset':
          _getOffsetFromCurrentPage(_pagingController.nextPageKey!, _limit),
      'limit': _limit,
    };

    return filters;
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

  void _setError(String error) {
    _pagingController.error = error;
  }

  void _updateData(PaginatedDataSuccess<List<Pokemon>> result) {
    if (result.meta!.next != null) {
      _pagingController.appendPage(
          result.data!,
          _getCurrentPageFromOffset(
                  _getOffsetFromCurrentPage(
                      _pagingController.nextPageKey!, _limit),
                  _limit) +
              1);
    } else {
      _pagingController.appendLastPage(result.data!);
    }
  }

  void getData() {
    _pagingController.refresh();
  }

  int _getCurrentPageFromOffset(int offset, int limit) {
    return (offset / limit).ceil() + 1;
  }

  int _getOffsetFromCurrentPage(int currentPage, int limit) {
    return (currentPage - 1) * limit;
  }
}
