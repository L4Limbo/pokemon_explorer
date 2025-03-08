import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/presentation/pokemon/view_models/pokemon_list_viewmodel.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/pokemon_type_filter.dart';

class PokemonListPage extends ConsumerWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pod = ref.watch(pokemonListViewModelProvider.notifier);
    final state = ref.watch(pokemonListViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Pokémon List')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            context.pushNamed('pokemon',
                pathParameters: {'pokemonName': 'pikachu'});
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.visibility),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: PokemonTypeMainFilter(
              onChanged: (pokemonType) {
                pod.updateSelectedPokemonType(pokemonType);
                pod.getData();
              },
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
                  itemBuilder: (context, pokemon, _) => ListTile(
                    title: Text(pokemon.name),
                    onTap: () {
                      context.pushNamed('pokemon', pathParameters: {
                        'pokemonName': pokemon.name,
                      });
                    },
                  ),
                  animateTransitions: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
