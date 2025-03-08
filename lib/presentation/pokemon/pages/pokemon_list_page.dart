import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/presentation/pokemon/pages/pokemon_detail_page.dart';
import 'package:pokemon_explorer/presentation/pokemon/view_models/pokemon_list_viewmodel.dart';
import 'package:pokemon_explorer/presentation/pokemon/widgets/pokemon_type_filter.dart';
import 'package:pokemon_explorer/utils/extensions.dart';

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
          appBar: AppBar(
            toolbarHeight: 80,
            title: Text(
              'Pokémon Explorer',
              style: GoogleFonts.bungee(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            centerTitle: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(180),
              ),
            ),
          ),
          floatingActionButton: state.pokemonListFilter.pokemonType != null
              ? Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(state.pokemonListFilter.pokemonType!.color!),
                      border: Border.all(color: Colors.white)),
                  child: IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/${state.pokemonListFilter.pokemonType!.name}.svg',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                )
              : null,
          body: Container(
            decoration: state.pokemonListFilter.pokemonType != null
                ? BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(state.pokemonListFilter.pokemonType!.color!)
                            .withAlpha(0),
                        Colors.black26
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  )
                : null,
            child: Column(
              children: [
                Padding(
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
                ),
                if (state.pokemonListFilter.pokemonType != null)
                  Padding(
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
                  ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async => _debouncedRefresh(pod),
                    child: PagedListView<int, Pokemon>(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                          bottom: 40, top: 16, right: 8, left: 8),
                      pagingController: state.pagingController,
                      builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                        itemBuilder: (context, pokemon, _) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 4),
                            child: InkWell(
                              onTap: () {
                                context.pushNamed('pokemon', pathParameters: {
                                  'pokemonName': pokemon.name,
                                });
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(15)),
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pokemon.name.formatName(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        animateTransitions: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
