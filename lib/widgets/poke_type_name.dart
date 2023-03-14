import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeTypeName extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PokeTypeName({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pokemonModel.name!,
                style: Constants.getPokeListNameTextStyle(),
              ),
              Text(
                "#${pokemonModel.num!.toString()}",
                style: Constants.getPokeListNameTextStyle(),
              )
            ],
          ),
        ),
        SizedBox(
          height: 0.02.sh,
        ),
        Padding(
          padding: UIHelper.defaultPadding(),
          child: Chip(
              elevation: 10,
              shadowColor: UIHelper.getColorFromType(pokemonModel.type![0]),
              label: Text(
                pokemonModel.type!.join(" , "),
                style: Constants.getPokeListChipTextStyle(),
              )),
        )
      ],
    );
  }
}
