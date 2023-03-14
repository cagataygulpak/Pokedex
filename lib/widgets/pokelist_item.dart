import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/widgets/poke_and_image_ball.dart';

class PokeListItem extends StatefulWidget {
  PokemonModel pokemon;
  PokeListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokeListItem> createState() => _PokeListItemState();
}

class _PokeListItemState extends State<PokeListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemonModel: widget.pokemon),
        ));
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(widget.pokemon.type![0]),
        child: Padding(
          padding: UIHelper.defaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.pokemon.name!,
                  style: Constants.getPokeListNameTextStyle()),
              Expanded(child: Chip(label: Text(widget.pokemon.type![0]))),
              Expanded(child: PokeandImageBall(pokemonModel: widget.pokemon))
            ],
          ),
        ),
      ),
    );
  }
}
