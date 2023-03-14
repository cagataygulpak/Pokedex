import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          color: Colors.white,
        ),
        child: Padding(
          padding: UIHelper.defaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInformationRow("Name", pokemon.name),
              _buildInformationRow("Height", pokemon.height),
              _buildInformationRow("Weight", pokemon.weight),
              _buildInformationRow("Spawn Time", pokemon.spawnTime),
              _buildInformationRow(
                "Weakness",
                pokemon.weaknesses,
              ),
              _buildInformationRow("Pre Evolutaion", pokemon.prevEvolution),
              _buildInformationRow("Next Evolutaion", pokemon.nextEvolution),
            ],
          ),
        ));
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokeInfoLabelStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(" , "),
            style: Constants.getPokeInfoTextStyle(),
          )
        else if (value == null)
          Text(
            "Not Available",
            style: Constants.getPokeInfoTextStyle(),
          )
        else
          Text(
            value,
            style: Constants.getPokeInfoTextStyle(),
          )
      ],
    );
  }
}
