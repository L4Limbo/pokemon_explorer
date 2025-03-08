import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_type_service.g.dart';

@riverpod
List<PokemonType> pokemonTypeService(Ref ref) {
  return [
    PokemonType(name: 'fire', color: 0xFFEE8130),
    PokemonType(name: 'water', color: 0xFF6390F0),
    PokemonType(name: 'grass', color: 0xFF7AC74C),
    PokemonType(name: 'electric', color: 0xFFF7D02C),
    PokemonType(name: 'dragon', color: 0xFF6F35FC),
    PokemonType(name: 'psychic', color: 0xFFF95587),
    PokemonType(name: 'ghost', color: 0xFF735797),
    PokemonType(name: 'dark', color: 0xFF705746),
    PokemonType(name: 'steel', color: 0xFFB7B7CE),
    PokemonType(name: 'fairy', color: 0xFFD685AD),
  ];
}
