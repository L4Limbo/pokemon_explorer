// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonDetailsDtoImpl _$$PokemonDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonDetailsDtoImpl(
      pokemon: PokemonDto.fromJson(json['pokemon'] as Map<String, dynamic>),
      basicStats: (json['basicStats'] as List<dynamic>)
          .map((e) => BasicStatDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokemonDetailsDtoImplToJson(
        _$PokemonDetailsDtoImpl instance) =>
    <String, dynamic>{
      'pokemon': instance.pokemon,
      'basicStats': instance.basicStats,
    };
