import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_type_service.g.dart';

@riverpod
List<PokemonType> pokemonTypeService(Ref ref) {
  return [
    PokemonType(name: 'fire', color: 0xFFA62B1F),
    PokemonType(name: 'water', color: 0xFF1F77B4),
    PokemonType(name: 'grass', color: 0xFF4C9F70),
    PokemonType(name: 'electric', color: 0xFFF1C232),
    PokemonType(name: 'dragon', color: 0xFF0F6EBF),
    PokemonType(name: 'psychic', color: 0xFFF70077),
    PokemonType(name: 'ghost', color: 0xFF5F5FBF),
    PokemonType(name: 'dark', color: 0xFF2F2F2F),
    PokemonType(name: 'steel', color: 0xFFB4B4B4),
    PokemonType(name: 'fairy', color: 0xFFFF99FF),
  ];
}
