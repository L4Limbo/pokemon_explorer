import 'package:go_router/go_router.dart';
import 'package:pokemon_explorer/presentation/pokemon/pages/pokemon_detail_page.dart';
import 'package:pokemon_explorer/presentation/pokemon/pages/pokemon_list_page.dart';

final router = GoRouter(
  initialLocation: '/pokemons',
  routes: <RouteBase>[
    GoRoute(
      name: 'pokemons',
      path: '/pokemons',
      redirect: (context, state) => '/pokemons',
      builder: (context, state) {
        return PokemonListPage();
      },
    ),
    GoRoute(
      name: 'pokemon',
      path: '/pokemons/:pokemonName',
      builder: (context, state) {
        final pokemonName = state.pathParameters['pokemonName']!;
        return PokemonDetailPage(pokemonName: pokemonName);
      },
    ),
  ],
);
