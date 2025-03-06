import 'package:dio/dio.dart';
import 'package:pokemon_explorer/data/data_sources/remote/api_service/api_service.dart';
import 'package:pokemon_explorer/data/dtos/basic_stat_dto.dart';
import 'package:pokemon_explorer/data/dtos/pokemon_details_dto.dart';
import 'package:pokemon_explorer/data/dtos/pokemon_dto.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state_types.dart';

class PokemonApiService {
  PokemonApiService(this._apiService);

  final ApiService _apiService;

  Future<DataState<List<PokemonDto>>> getPokemons(
      Map<String, dynamic> queryParameters) async {
    try {
      final response =
          await _apiService.get('v2/pokemon', queryParameters: queryParameters);

      final result = (response.data['results'] as List)
          .map((e) => PokemonDto.fromJson(e))
          .toList();

      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(
        DioException(
          type: DioExceptionType.unknown,
          requestOptions: RequestOptions(path: ''),
          error: 'Unexpected response',
        ),
      );
    }
  }

  Future<DataState<PokemonDetailsDto>> getPokemon(String pokemonName) async {
    try {
      final response = await _apiService.get('v2/pokemon/$pokemonName');

      final PokemonDto pokemonDto = PokemonDto.fromApiResponse(response.data);
      final List<BasicStatDto> basicStats = ((response.data['stats'] as List)
          .map((e) => BasicStatDto.fromApiResponse(e))).toList();

      final result =
          PokemonDetailsDto(pokemon: pokemonDto, basicStats: basicStats);

      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(
        DioException(
          type: DioExceptionType.unknown,
          requestOptions: RequestOptions(path: ''),
          error: 'Unexpected response',
        ),
      );
    }
  }
}
