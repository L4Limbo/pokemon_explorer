import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_explorer/data/data_sources/remote/api_service/api_service.dart';
import 'package:pokemon_explorer/data/data_sources/remote/pokemon/pokemon_api_service.dart';
import 'package:pokemon_explorer/data/repositories/pokemon_repository_impl.dart';

class PokemonListPage extends ConsumerWidget {
  final int offset;

  PokemonListPage({Key? key, this.offset = 0}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokémon List')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            print((await PokemonRepositoryImpl(PokemonApiService(ApiService()))
                    .getPokemon('pikachu'))
                .data);
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
