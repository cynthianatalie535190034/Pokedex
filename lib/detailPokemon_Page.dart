import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class detailPokemon_Page extends StatelessWidget {
  String args;
  Future pokeApi(String name) async {
    String url = "https://pokeapi.co/api/v2/pokemon/$name";

    try {
      var responInJSON = await http.get(url);
      var decodeTheJSONtoFlutterMAP = json.decode(responInJSON.body);

      return decodeTheJSONtoFlutterMAP;
    } catch (e) {
      return e;
    }
  }

  String urlBuatFoto(int pokedexIndex) {
    String url =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokedexIndex.png";

    return url;
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: FutureBuilder(
            builder: (context, pokemonData) {
              if (pokemonData.connectionState == ConnectionState.done) {
                var dataPokemon = pokemonData.data;
                print(dataPokemon.toString());
                return Container(
                  child: Column(
                    children: [
                      Center(
                        child: Image.network(
                          urlBuatFoto(pokemonData.data['id']),
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Text("ID: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(pokemonData.data['id'].toString()),
                      Text("Name: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(pokemonData.data['name'].toString()),
                      Text("Abilities: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      pokemonData.data['abilities'].length == 1
                          ? Text(pokemonData.data['abilities'][0]['ability']
                              ['name'])
                          : Text(
                              "${pokemonData.data['abilities'][0]['ability']['name']},  ${pokemonData.data['abilities'][1]['ability']['name']}",
                              textAlign: TextAlign.center),
                      Text("Moves: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      pokemonData.data['moves'].length == 1
                          ? Text(pokemonData.data['moves'][0]['move']['name'])
                          : Text(
                              "${pokemonData.data['moves'][0]['move']['name']}",
                              textAlign: TextAlign.center),
                      pokemonData.data['moves'].length == 1
                          ? Text(pokemonData.data['moves'][0]['move']['name'])
                          : Text(
                              "${pokemonData.data['moves'][1]['move']['name']}",
                              textAlign: TextAlign.center),
                      pokemonData.data['moves'].length == 1
                          ? Text(pokemonData.data['moves'][0]['move']['name'])
                          : Text(
                              "${pokemonData.data['moves'][2]['move']['name']}",
                              textAlign: TextAlign.center),
                      pokemonData.data['moves'].length == 1
                          ? Text(pokemonData.data['moves'][0]['move']['name'])
                          : Text(
                              "${pokemonData.data['moves'][3]['move']['name']}",
                              textAlign: TextAlign.center),
                      Text("Types: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      pokemonData.data['types'].length == 1
                          ? Text(pokemonData.data['types'][0]['type']['name'])
                          : Text(
                              "${pokemonData.data['types'][0]['type']['name']} ,${pokemonData.data['types'][1]['type']['name']}  "),
                      Text("Weight:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(pokemonData.data['weight'].toString()),
                      Text("Height:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(pokemonData.data['height'].toString()),
                      Text("Stats: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      pokemonData.data['stats'].length == 1
                          ? Text(pokemonData.data['stats'][0]['stat']['name'])
                          : Text(
                              "${pokemonData.data['stats'][0]['stat']['name']} : ${pokemonData.data['stats'][0]['base_stat']}",
                              textAlign: TextAlign.center),
                      pokemonData.data['stats'].length == 1
                          ? Text(pokemonData.data['stats'][0]['stat']['name'])
                          : Text(
                              "${pokemonData.data['stats'][1]['stat']['name']} : ${pokemonData.data['stats'][1]['base_stat']}",
                              textAlign: TextAlign.center),
                      pokemonData.data['stats'].length == 1
                          ? Text(pokemonData.data['stats'][0]['stat']['name'])
                          : Text(
                              "${pokemonData.data['stats'][2]['stat']['name']} : ${pokemonData.data['stats'][2]['base_stat']}",
                              textAlign: TextAlign.center),
                      pokemonData.data['stats'].length == 1
                          ? Text(pokemonData.data['stats'][0]['stat']['name'])
                          : Text(
                              "${pokemonData.data['stats'][3]['stat']['name']} : ${pokemonData.data['stats'][3]['base_stat']}",
                              textAlign: TextAlign.center),
                      pokemonData.data['stats'].length == 1
                          ? Text(pokemonData.data['stats'][0]['stat']['name'])
                          : Text(
                              "${pokemonData.data['stats'][4]['stat']['name']} : ${pokemonData.data['stats'][4]['base_stat']}",
                              textAlign: TextAlign.center),
                      pokemonData.data['stats'].length == 1
                          ? Text(pokemonData.data['stats'][0]['stat']['name'])
                          : Text(
                              "${pokemonData.data['stats'][5]['stat']['name']} : ${pokemonData.data['stats'][5]['base_stat']}",
                              textAlign: TextAlign.center),
                      Text("Pokemon Game: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      pokemonData.data['game_indices'].length == 1
                          ? Text(pokemonData.data['game_indices'][0]['version']
                              ['name'])
                          : Text(
                              "${pokemonData.data['game_indices'][0]['version']['name']}, ${pokemonData.data['game_indices'][1]['version']['name']}, ${pokemonData.data['game_indices'][2]['version']['name']}, ${pokemonData.data['game_indices'][3]['version']['name']}, ${pokemonData.data['game_indices'][4]['version']['name']}",
                              textAlign: TextAlign.center),
                      pokemonData.data['game_indices'].length == 1
                          ? Text(pokemonData.data['game_indices'][0]['version']
                              ['name'])
                          : Text(
                              "${pokemonData.data['game_indices'][5]['version']['name']}, ${pokemonData.data['game_indices'][6]['version']['name']}, ${pokemonData.data['game_indices'][7]['version']['name']}, ${pokemonData.data['game_indices'][8]['version']['name']}, ${pokemonData.data['game_indices'][9]['version']['name']}",
                              textAlign: TextAlign.center),
                      pokemonData.data['game_indices'].length == 1
                          ? Text(pokemonData.data['game_indices'][0]['version']
                              ['name'])
                          : Text(
                              "${pokemonData.data['game_indices'][10]['version']['name']}, ${pokemonData.data['game_indices'][11]['version']['name']}, ${pokemonData.data['game_indices'][12]['version']['name']}, ${pokemonData.data['game_indices'][13]['version']['name']}, ${pokemonData.data['game_indices'][14]['version']['name']}",
                              textAlign: TextAlign.center),
                      pokemonData.data['game_indices'].length == 1
                          ? Text(pokemonData.data['game_indices'][0]['version']
                              ['name'])
                          : Text(
                              "${pokemonData.data['game_indices'][15]['version']['name']}, ${pokemonData.data['game_indices'][16]['version']['name']}, ${pokemonData.data['game_indices'][17]['version']['name']}, ${pokemonData.data['game_indices'][18]['version']['name']}, ${pokemonData.data['game_indices'][19]['version']['name']}",
                              textAlign: TextAlign.center),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            future: pokeApi(args),
          ),
        ));
  }
}
