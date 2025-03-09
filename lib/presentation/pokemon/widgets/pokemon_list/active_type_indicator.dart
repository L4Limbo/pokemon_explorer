import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_explorer/presentation/pokemon/states/pokemon_list_state.dart';

class ActiveTypeIndicator extends StatelessWidget {
  const ActiveTypeIndicator({
    super.key,
    required this.state,
  });

  final PokemonListState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(state.pokemonListFilter.pokemonType!.color!),
          border: Border.all(color: Colors.white)),
      child: IconButton(
        iconSize: 30,
        onPressed: () {},
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/icons/${state.pokemonListFilter.pokemonType!.name}.svg',
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}
