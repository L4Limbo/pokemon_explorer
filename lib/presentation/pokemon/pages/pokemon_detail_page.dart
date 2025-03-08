import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';
import 'package:pokemon_explorer/domain/services/pokemon_type_service.dart';
import 'package:pokemon_explorer/presentation/pokemon/view_models/pokemon_detail_viewmodel.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/basic_stats_card.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/simple_tag.dart';

class PokemonDetailPage extends ConsumerWidget {
  final String pokemonName;

  const PokemonDetailPage({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonDetailState =
        ref.watch(pokemonDetailViewModelProvider(pokemonName));
    final allPokemonTypes = ref.watch(pokemonTypeServiceProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: pokemonDetailState.when(
        data: (pokemonData) {
          final pokemon = pokemonData.value!.pokemon;

          Color basicColor =
              _getTypeColor(allPokemonTypes, pokemonData.value!.types);

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
                      backgroundColor: basicColor,
                      expandedHeight: 300,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                _nameFormatter(pokemon.name),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
                                basicColor,
                                basicColor,
                                Theme.of(context).scaffoldBackgroundColor,
                              ],
                              stops: [0.0, 0.6, 0.3, 1.0],
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Image.network(
                              pokemonData.value!.pokemon.imagePath!,
                              height: 200,
                              width: 200,
                              fit: BoxFit.contain,
                            ),
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
                              child: ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 600),
                                child: Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: SizedBox(
                                    height: 50,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: pokemonData.value!.types
                                          .map(
                                            (pokemonType) => Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2.0, right: 8.0),
                                              child: SimpleTag(
                                                label: _nameFormatter(
                                                  pokemonType.name,
                                                ),
                                                backgroundColor: _getTypeColor(
                                                  allPokemonTypes,
                                                  [pokemonType],
                                                ),
                                                textColor: Colors.white,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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

  Color _getTypeColor(
      List<PokemonType> allPokemonTypes, List<PokemonType> pokemonTypes) {
    Color basicColor = Color(0xFF000000);

    if (pokemonTypes.isNotEmpty) {
      List<PokemonType> matchingTypes =
          allPokemonTypes.where((e) => e.name == pokemonTypes[0].name).toList();
      if (matchingTypes.isNotEmpty) {
        basicColor = Color(matchingTypes.first.color!);
      }
    }

    return basicColor;
  }

  String _nameFormatter(String name) {
    return name
        .split('-')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
