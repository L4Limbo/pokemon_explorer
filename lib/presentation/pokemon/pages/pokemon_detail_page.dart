import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_launcher/cli_commands.dart';
import 'package:pokemon_explorer/presentation/pokemon/view_models/pokemon_detail_viewmodel.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/basic_stats_card.dart';

class PokemonDetailPage extends ConsumerWidget {
  final String pokemonName;

  const PokemonDetailPage({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonDetailState =
        ref.watch(pokemonDetailViewModelProvider(pokemonName));

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: pokemonDetailState.when(
        data: (pokemonData) {
          final pokemon = pokemonData.value!.pokemon;

          return RefreshIndicator(
            onRefresh: () async {
              await ref
                  .read(pokemonDetailViewModelProvider(pokemonName).notifier)
                  .fetchPokemonDetails();
            },
            child: DefaultTabController(
              length: 1,
              child: Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: CustomScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      expandedHeight: 300,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          pokemon.name.capitalize(),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        centerTitle: true,
                        background: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black87,
                                Colors.amber,
                                Colors.amber,
                                Theme.of(context).scaffoldBackgroundColor,
                              ],
                              stops: [0.0, 0.6, 0.3, 1.0],
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                            ),
                          ),
                          child: Image.network(
                            pokemonData.value!.pokemon.imagePath!,
                            height: 500,
                            width: 500,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.all(16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Center(
                              child: BasicStatsCard(
                                stats: pokemonData.value!.basicStats,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
            child: TextButton(
          onPressed: () async {
            await ref
                .read(pokemonDetailViewModelProvider(pokemonName).notifier)
                .fetchPokemonDetails();
          },
          child: Text('Try again'),
        )),
      ),
    );
  }
}
