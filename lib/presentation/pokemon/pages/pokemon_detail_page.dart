import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_details.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';
import 'package:pokemon_explorer/domain/services/pokemon_type_service.dart';
import 'package:pokemon_explorer/presentation/core/widgets/error_retry_widget.dart';
import 'package:pokemon_explorer/presentation/core/widgets/network_status_bar.dart';
import 'package:pokemon_explorer/presentation/pokemon/view_models/pokemon_detail_viewmodel.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/pokemon_details/basic_stats_card.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/pokemon_details/pokemon_details_app_bar.dart';
import 'package:pokemon_explorer/presentation/core/widgets/simple_tag.dart';
import 'package:pokemon_explorer/utils/extensions.dart';

class PokemonDetailPage extends ConsumerWidget {
  final String pokemonName;

  const PokemonDetailPage({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonDetailState =
        ref.watch(pokemonDetailViewModelProvider(pokemonName));
    final allPokemonTypes = ref.watch(pokemonTypeServiceProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            pokemonDetailState.when(
              data: (pokemonData) {
                final pokemon = pokemonData.pokemon;
                Color basicColor =
                    _getTypeColor(allPokemonTypes, pokemonData.types);

                return RefreshIndicator(
                  onRefresh: () async {
                    await ref
                        .read(pokemonDetailViewModelProvider(pokemonName)
                            .notifier)
                        .fetchPokemonDetails();
                  },
                  child: DefaultTabController(
                    length: 1,
                    child: Scaffold(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      body: CustomScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        slivers: [
                          PokemonDetailsAppBar(
                              basicColor: basicColor, pokemon: pokemon),
                          SliverPadding(
                            padding: EdgeInsets.all(16),
                            sliver: SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  _typeTags(pokemonData, allPokemonTypes),
                                  _basicStats(pokemonData),
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
              loading: () => _loading(),
              error: (error, stackTrace) {
                return CustomScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  slivers: [
                    _noPokemonAppBar(context),
                    SliverPadding(
                      padding: EdgeInsets.all(16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            _errorMessageCard(error, ref),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(top: 0, left: 0, right: 0, child: NetworkStatusBar()),
          ],
        ),
      ),
    );
  }

  Center _errorMessageCard(Object error, WidgetRef ref) {
    return Center(
      child: ErrorRetryWidget(
        errorMessage: error.toString(),
        onRetry: () async {
          await ref
              .read(pokemonDetailViewModelProvider(pokemonName).notifier)
              .fetchPokemonDetails();
        },
      ),
    );
  }

  SliverAppBar _noPokemonAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              'This Pokémon can\'t be caught'.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor,
                Theme.of(context).scaffoldBackgroundColor,
              ],
              stops: [0.0, 0.6, 0.3, 1.0],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
          ),
        ),
      ),
    );
  }

  Center _loading() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 6,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      ),
    );
  }

  Center _basicStats(PokemonDetails pokemonData) {
    return Center(
      child: BasicStatsCard(
        stats: pokemonData.basicStats,
      ),
    );
  }

  Center _typeTags(
      PokemonDetails pokemonData, List<PokemonType> allPokemonTypes) {
    return Center(
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
              children: pokemonData.types
                  .map(
                    (pokemonType) => Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 8.0),
                      child: SimpleTag(
                        label: pokemonType.name.formatName(),
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
}
