import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widgets/poke_information.dart';
import 'package:pokedex/widgets/poke_type_name.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel pokemonModel;
  DetailPage({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context)
        : _buildLandscapeBody(context);
  }

  Scaffold _buildLandscapeBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(widget.pokemonModel.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              padding: UIHelper.iconPadding(),
              iconSize: 18.w,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios)),
          Expanded(
              child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PokeTypeName(pokemonModel: widget.pokemonModel),
                    Hero(
                      tag: widget.pokemonModel.id!,
                      child: CachedNetworkImage(
                        imageUrl: widget.pokemonModel.img ?? "",
                        height: 0.25.sw,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: UIHelper.defaultPadding(),
                  child: PokeInformation(
                    pokemon: widget.pokemonModel,
                  ),
                ),
              ),
            ],
          )),
        ],
      )),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(widget.pokemonModel.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              padding: UIHelper.iconPadding(),
              iconSize: 18.w,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios)),
          PokeTypeName(pokemonModel: widget.pokemonModel),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Stack(children: [
              Positioned(
                child: Image.asset(
                  "assets/images/pokeball.png",
                  height: 0.15.sh,
                  fit: BoxFit.fitHeight,
                ),
                right: 0,
                top: 0,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0.12.sh,
                child: PokeInformation(
                  pokemon: widget.pokemonModel,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: widget.pokemonModel.id!,
                  child: CachedNetworkImage(
                    imageUrl: widget.pokemonModel.img ?? "",
                    height: 0.25.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ]),
          )
        ],
      )),
    );
  }
}
