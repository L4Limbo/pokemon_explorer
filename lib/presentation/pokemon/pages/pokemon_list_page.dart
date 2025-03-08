import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/presentation/pokemon/view_models/pokemon_list_viewmodel.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/pokemon_type_filter.dart';

class PokemonListPage extends ConsumerWidget {
  PokemonListPage({super.key});
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                pod.getData();
              },
            ),
          ),
          if (state.pokemonListFilter.pokemonType != null)
            TextFormField(
              controller: _searchController,
              onChanged: (value) {
                _onSearchChanged(value, pod);
              },
              decoration: InputDecoration(
                hintText: 'search...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchController.clear();
                    _onSearchChanged("", pod);
                  },
                  icon: const Icon(Icons.clear),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => pod.getData(),
              child: PagedListView<int, Pokemon>(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(
                    bottom: 60, top: 10, right: 8, left: 8),
                pagingController: state.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                  itemBuilder: (context, pokemon, int i) {
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
  }

  void _onSearchChanged(String value, PokemonListViewModel pod) {
    pod.updatePokemonSearchName(value);

    pod.getData();
  }
}
