import 'package:flutter/material.dart';
import 'package:pokemon_explorer/domain/models/pokemon/pokemon.dart';
import 'package:pokemon_explorer/utils/extensions.dart';

class PokemonDetailsAppBar extends StatelessWidget {
  const PokemonDetailsAppBar({
    super.key,
    required this.basicColor,
    required this.pokemon,
  });

  final Color basicColor;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: basicColor,
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                pokemon.name.formatName(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.black87,
                basicColor,
                basicColor,
                Theme.of(context).scaffoldBackgroundColor,
              ],
              stops: [0.0, 0.6, 0.3, 1.0],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.network(
              pokemon.imagePath!,
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
