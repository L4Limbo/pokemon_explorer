import 'package:pokemon_explorer/domain/models/data_states/data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state_types.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_details.dart';
import 'package:pokemon_explorer/domain/usecases/get_pokemon_details_usecase.dart';
import 'package:pokemon_explorer/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_detail_viewmodel.g.dart';

@riverpod
class PokemonDetailViewModel extends _$PokemonDetailViewModel {
  late GetPokemonDetailsUseCase _getPokemonUsecase;
  late String _pokemonName;

  @override
  Future<AsyncValue<PokemonDetails>> build(String pokemonName) async {
    _getPokemonUsecase = ref.watch(getPokemonDetailUseCaseProvider);
    _pokemonName = pokemonName;

    return await fetchPokemonDetails();
  }

  Future<AsyncValue<PokemonDetails>> fetchPokemonDetails() async {
    state = const AsyncValue.loading();

    try {
      final pokemon = await _getPokemonUsecase.getPokemon(_pokemonName);

      if (pokemon is DataSuccess<PokemonDetails> && pokemon.data != null) {
        return _handleSuccess(pokemon);
      } else if (pokemon is DataFailed) {
        return _handleError(pokemon.error!.message!.toString());
      } else {
        return _handleError(ErrorMessages.unexpectedError);
      }
    } catch (e) {
      return _handleError(ErrorMessages.unexpectedError);
    }
  }

  AsyncValue<PokemonDetails> _handleSuccess(DataState<PokemonDetails> pokemon) {
    state = AsyncValue.data(AsyncData(pokemon.data!));
    return AsyncValue.data(pokemon.data!);
  }

  AsyncValue<PokemonDetails> _handleError(String error) {
    state = AsyncValue.error(error, StackTrace.empty);
    return AsyncValue.error(error, StackTrace.empty);
  }
}
