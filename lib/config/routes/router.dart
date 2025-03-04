import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/pokemons',
  routes: <RouteBase>[
    GoRoute(
      name: 'pokemons',
      path: '/pokemons',
      redirect: (context, state) => '/pokemons',
      builder: (context, state) {
        return Center(
          child: Text('pokemons'),
        );
      },
    ),
    GoRoute(
      name: 'pokemon',
      path: '/pokemons/:pokemonName',
      builder: (context, state) {
        final pokemonName = state.pathParameters['pokemonName']!;
        return Center(child: Text('pokemon: $pokemonName'));
      },
    ),
  ],
);
