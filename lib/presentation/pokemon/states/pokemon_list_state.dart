import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_list_filter.dart';

part 'pokemon_list_state.freezed.dart';

@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    required PagingController<int, Pokemon> pagingController,
    required PokemonListFilter pokemonListFilter,
  }) = _ItemListState;
}
