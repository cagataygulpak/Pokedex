import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokemonApi {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _pokemonListesi = [];
    var _results = await Dio().get(_url);
    var _pokeList = jsonDecode(_results.data)["pokemon"];

    if (_pokeList is List) {
      _pokemonListesi = _pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    }

    debugPrint(_pokemonListesi.first.toString());

    return _pokemonListesi;
  }
}
