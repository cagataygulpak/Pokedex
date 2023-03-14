import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/services/pokemon_api.dart';
import 'package:pokedex/widgets/pokelist_item.dart';

class PokemonListesi extends StatefulWidget {
  PokemonListesi({Key? key}) : super(key: key);

  @override
  State<PokemonListesi> createState() => _PokemonListesiState();
}

class _PokemonListesiState extends State<PokemonListesi> {
  late Future<List<PokemonModel>> _pokemonListesi;
  @override
  void initState() {
    super.initState();
    _pokemonListesi = PokemonApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListesi,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> pokemonModelListesi = snapshot.data!;
          return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3),itemCount: pokemonModelListesi.length,
              itemBuilder: (context, index) => PokeListItem(pokemon: pokemonModelListesi[index],));
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Hata"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

/* ListView.builder(
            itemCount: pokemonModelListesi.length,
            itemBuilder: (context, index) {
              var oAnkiPokemon = pokemonModelListesi[index];
              return ListTile(
                title: Text(oAnkiPokemon.name.toString()),
                subtitle: Text(oAnkiPokemon.type.toString()),
                leading: CircleAvatar(
                  child: Text(oAnkiPokemon.id.toString()),
                ),
                trailing: Text(oAnkiPokemon.spawnChance.toString()),
              );
            },
          );
 */