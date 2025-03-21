import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pokemon_explorer/data/data_sources/remote/api_service/api_service.dart';
import 'package:pokemon_explorer/data/dtos/basic_stat_dto.dart';
import 'package:pokemon_explorer/data/dtos/pokemon_details_dto.dart';
import 'package:pokemon_explorer/data/dtos/pokemon_dto.dart';
import 'package:pokemon_explorer/data/dtos/pokemon_type_dto.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/data_state_types.dart';
import 'package:pokemon_explorer/domain/models/data_states/paginated_data_state.dart';
import 'package:pokemon_explorer/domain/models/data_states/pagination_meta.dart';
import 'package:pokemon_explorer/utils/constants.dart';

part 'pokemon_api_service.g.dart';

@riverpod
PokemonApiService pokemonApiService(Ref ref) {
  final apiService = ref.watch(apiServiceProvider);
  return PokemonApiService(apiService);
}

class PokemonApiService {
  PokemonApiService(this._apiService);

  final ApiService _apiService;

  Future<PaginatedDataState<List<PokemonDto>>> getPokemons(
      Map<String, dynamic> queryParameters) async {
    try {
      final response =
          await _apiService.get('v2/pokemon', queryParameters: queryParameters);

      final pokemonDtos = (response.data['results'] as List)
          .map((e) => PokemonDto.fromJson(e))
          .toList();

      final PaginationMeta paginationMeta = PaginationMeta(
        count: response.data['count'],
        next: response.data['next'],
        previous: response.data['previous'],
      );

      return PaginatedDataSuccess(pokemonDtos, paginationMeta);
    } on DioException catch (e) {
      return PaginatedDataFailed(e);
    } catch (e) {
      return PaginatedDataFailed(
        DioException(
          type: DioExceptionType.unknown,
          requestOptions: RequestOptions(path: ''),
          error: ErrorMessages.unexpectedError,
          message: ErrorMessages.unexpectedError,
        ),
      );
    }
  }

  Future<DataState<List<PokemonDto>>> getPokemonsByType(
      String pokemonType) async {
    try {
      final response =
          await _apiService.get('v2/type/$pokemonType', queryParameters: {});

      final pokemonDtos = (response.data['pokemon'] as List)
          .map((e) => PokemonDto.fromJson(e['pokemon']))
          .toList();

      return DataSuccess(pokemonDtos);
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(
        DioException(
          type: DioExceptionType.unknown,
          requestOptions: RequestOptions(path: ''),
          error: ErrorMessages.unexpectedError,
          message: ErrorMessages.unexpectedError,
        ),
      );
    }
  }

  Future<DataState<PokemonDetailsDto>> getPokemon(String pokemonName) async {
    var basicStatNames = ['attack', 'defense', 'hp'];

    try {
      final response = await _apiService.get('v2/pokemon/$pokemonName');

      final PokemonDto pokemonDto = PokemonDto.fromApiResponse(response.data);

      final List<BasicStatDto> basicStats = ((response.data['stats'] as List)
          .map((e) => BasicStatDto.fromApiResponse(e))).toList().where((e) {
        return basicStatNames.contains(e.name);
      }).toList();

      final List<PokemonTypeDto> types = ((response.data['types'] as List)
          .map((e) => PokemonTypeDto.fromApiResponse(e))).toList();

      final result = PokemonDetailsDto(
          pokemon: pokemonDto, basicStats: basicStats, types: types);

      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(
        DioException(
          type: DioExceptionType.unknown,
          requestOptions: RequestOptions(path: ''),
          error: ErrorMessages.unexpectedError,
          message: ErrorMessages.unexpectedError,
        ),
      );
    }
  }
}
