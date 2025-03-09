import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';
import 'package:pokemon_explorer/presentation/pokemon/view_models/pokemon_select_type_viewmodel.dart';
import 'package:pokemon_explorer/utils/extensions.dart';

class PokemonTypeMainFilter extends ConsumerWidget {
  final Function(PokemonType?) onChanged;
  final PokemonType? initialPokemonType;

  const PokemonTypeMainFilter({
    super.key,
    required this.onChanged,
    this.initialPokemonType,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pokemonSelectTypeViewModelProvider);
    final pod = ref.read(pokemonSelectTypeViewModelProvider.notifier);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state.pokemonTypes.length,
      itemBuilder: (context, index) {
        final isSelected =
            state.pokemonTypes[index] == state.selectedPokemonType;

        return GestureDetector(
          onTap: () {
            if (state.pokemonTypes[index] != state.selectedPokemonType) {
              onChanged(state.pokemonTypes[index]);
              pod.selectPokemonType(state.pokemonTypes[index]);
            }

            if (state.pokemonTypes[index] == state.selectedPokemonType) {
              onChanged(null);
              pod.selectPokemonType(null);
            }
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            height: 50,
            width: 180,
            decoration: BoxDecoration(
              color: !isSelected
                  ? Color(state.pokemonTypes[index].color!).withOpacity(0.8)
                  : state.pokemonTypes[index].color != null
                      ? Color(state.pokemonTypes[index].color!)
                      : null,
              border: Border.all(
                color: Colors.white,
                width: isSelected ? 6 : 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      state.pokemonTypes[index].name.formatName(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/${state.pokemonTypes[index].name}.svg',
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
