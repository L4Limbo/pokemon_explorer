import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/presentation/pokemon/view_models/pokemon_list_viewmodel.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/pokemon_type_filter.dart';

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
        final pod = ref.watch(pokemonListViewModelProvider.notifier);
        final state = ref.watch(pokemonListViewModelProvider);
        _searchController.text = state.pokemonListFilter.pokemonName ?? '';

        return Scaffold(
          appBar: AppBar(title: Text('Pokémon List')),
          body: Column(
            children: [
              SizedBox(
                height: 200,
                child: PokemonTypeMainFilter(
                  onChanged: (pokemonType) {
                    pod.updateSelectedPokemonType(pokemonType);
                    pod.updatePokemonSearchName(null);
                    _debouncedRefresh(pod);
                  },
                ),
              ),
              if (state.pokemonListFilter.pokemonType != null)
                TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    _debouncedSearch(value, pod);
                  },
                  decoration: InputDecoration(
                    hintText: 'search...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_searchController.text.isNotEmpty) {
                          _searchController.clear();
                          _debouncedSearch("", pod);
                        }
                      },
                      icon: const Icon(Icons.clear),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => _debouncedRefresh(pod),
                  child: PagedListView<int, Pokemon>(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                        bottom: 60, top: 10, right: 8, left: 8),
                    pagingController: state.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                      itemBuilder: (context, pokemon, _) {
                        return ListTile(
                          title: Text(pokemon.name),
                          onTap: () {
                            context.pushNamed('pokemon', pathParameters: {
                              'pokemonName': pokemon.name,
                            });
                          },
                        );
                      },
                      animateTransitions: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _debouncedSearch(String value, PokemonListViewModel pod) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      pod.updatePokemonSearchName(value);
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
