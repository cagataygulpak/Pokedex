import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeandImageBall extends StatelessWidget {
  PokemonModel pokemonModel;
  PokeandImageBall({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            "assets/images/pokeball.png",
            width: UIHelper.getCalculatePokeandImageBall(),
            height: UIHelper.getCalculatePokeandImageBall(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemonModel.id!,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => const Icon(
                Icons.question_mark,
                size: 20,
              ),
              imageUrl: pokemonModel.img!,
              width: UIHelper.getCalculatePokeandImageBall(),
              height: UIHelper.getCalculatePokeandImageBall(),
              fit: BoxFit.fitHeight,
              placeholder: (context, string) => CircularProgressIndicator(
                color: UIHelper.getColorFromType(pokemonModel.type![0]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
