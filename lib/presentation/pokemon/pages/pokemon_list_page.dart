import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/presentation/core/widgets/error_retry_widget.dart';
import 'package:pokemon_explorer/presentation/core/widgets/global_app_bar.dart';
import 'package:pokemon_explorer/presentation/pokemon/states/pokemon_list_state.dart';
import 'package:pokemon_explorer/presentation/pokemon/view_models/pokemon_list_viewmodel.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/pokemon_list/active_type_indicator.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/pokemon_list/pokemon_card.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/pokemon_list/pokemon_type_filter.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final _searchController = TextEditingController();
  Timer? _searchDebounce;
  Timer? _refreshDebounce;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final pod = ref.read(pokemonListViewModelProvider.notifier);
        final state = ref.watch(pokemonListViewModelProvider);
        _searchController.text = state.pokemonListFilter.pokemonName ?? '';

        return Scaffold(
          backgroundColor: state.pokemonListFilter.pokemonType != null
              ? Color(state.pokemonListFilter.pokemonType!.color!)
              : null,
          appBar: GlobalAppBar(),
          floatingActionButton: state.pokemonListFilter.pokemonType != null
              ? ActiveTypeIndicator(state: state)
              : null,
          body: Container(
            decoration: state.pokemonListFilter.pokemonType != null
                ? _backgroundDecoration(state)
                : null,
            child: Column(
              children: [
                _typeFilter(pod),
                if (state.pokemonListFilter.pokemonType != null)
                  _searchFilter(pod),
                _pokemonList(pod, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded _pokemonList(PokemonListViewModel pod, PokemonListState state) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async => _debouncedRefresh(pod),
        child: PagedListView<int, Pokemon>(
          physics: const AlwaysScrollableScrollPhysics(),
          padding:
              const EdgeInsets.only(bottom: 40, top: 16, right: 8, left: 8),
          pagingController: state.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Pokemon>(
            newPageErrorIndicatorBuilder: (context) => ErrorRetryWidget(
              errorMessage: state.pagingController.error,
              onRetry: () async => _debouncedRefresh(pod),
            ),
            firstPageErrorIndicatorBuilder: (context) => ErrorRetryWidget(
              errorMessage: state.pagingController.error,
              onRetry: () async => _debouncedRefresh(pod),
            ),
            itemBuilder: (context, pokemon, _) {
              return PokemonCard(
                  pokemon: pokemon,
                  onTap: () {
                    context.pushNamed('pokemon', pathParameters: {
                      'pokemonName': pokemon.name,
                    });
                  });
            },
            animateTransitions: true,
          ),
        ),
      ),
    );
  }

  Padding _searchFilter(PokemonListViewModel pod) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _searchController,
        onChanged: (value) {
          pod.updatePokemonSearchName(value);

          _debouncedSearch(value, pod);
        },
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              if (_searchController.text.isNotEmpty) {
                _searchController.clear();
                pod.updatePokemonSearchName(null);

                _debouncedSearch("", pod);
              }
            },
            icon: const Icon(Icons.clear),
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Padding _typeFilter(PokemonListViewModel pod) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: 100,
        child: PokemonTypeMainFilter(
          onChanged: (pokemonType) {
            pod.updateSelectedPokemonType(pokemonType);
            pod.updatePokemonSearchName(null);
            _debouncedRefresh(pod);
          },
        ),
      ),
    );
  }

  BoxDecoration _backgroundDecoration(PokemonListState state) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(state.pokemonListFilter.pokemonType!.color!).withAlpha(0),
          Colors.black26
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  void _debouncedSearch(String value, PokemonListViewModel pod) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      pod.getData();
    });
  }

  Future<void> _debouncedRefresh(PokemonListViewModel pod) async {
    _refreshDebounce?.cancel();
    _refreshDebounce = Timer(const Duration(milliseconds: 500), () {
      pod.getData();
    });
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _refreshDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }
}
