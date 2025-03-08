import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon_type.dart';
import 'package:pokemon_explorer/presentation/pokemon/view_models/pokemon_select_type_viewmodel.dart';

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

        final color = Theme.of(context).scaffoldBackgroundColor;

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
            height: 80,
            width: 180,
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).primaryColor : color,
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Theme.of(context).primaryColor,
                width: isSelected ? 3 : 2,
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
                      state.pokemonTypes[index].name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: isSelected ? 18 : 16,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : Theme.of(context).primaryColor,
                      ),
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
