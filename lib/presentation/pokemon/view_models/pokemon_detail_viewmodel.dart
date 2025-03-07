import 'package:pokemon_explorer/domain/models/data_states/data_state_types.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_details.dart';
import 'package:pokemon_explorer/domain/usecases/get_pokemon_details_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_detail_viewmodel.g.dart';

@riverpod
class PokemonDetailViewModel extends _$PokemonDetailViewModel {
  late GetPokemonDetailsUseCase _useCase;

  late String _pokemonName;

  @override
  Future<AsyncValue<PokemonDetails>> build(String pokemonName) async {
    _useCase = ref.watch(getPokemonDetailUseCaseProvider);

    _pokemonName = pokemonName;
    state = const AsyncValue.loading();
    return await fetchPokemonDetails();
  }

  Future<AsyncValue<PokemonDetails>> fetchPokemonDetails() async {
    try {
      final pokemon = await _useCase.getPokemon(_pokemonName);

      if (pokemon is DataSuccess) {
        state = AsyncValue.data(AsyncData(pokemon.data!));
        return AsyncValue.data(pokemon.data!);
      } else if (pokemon is DataFailed) {
        state = AsyncValue.error(pokemon.error!.error!, StackTrace.current);
        return AsyncValue.error(pokemon.error!.error!, StackTrace.current);
      } else {
        return AsyncValue.error('e', StackTrace.empty);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.empty);
      return AsyncValue.error(e, StackTrace.empty);
    }
  }
}
