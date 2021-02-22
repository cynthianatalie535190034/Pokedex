import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detailPokemon_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pokedex',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: {
        '/detailPokemon': (BuildContext context) => detailPokemon_Page()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  Future pokeApi() async {
    String url = "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0";

    try {
      var responInJSON = await http.get(url);
      var decodeTheJSONtoFlutterMAP = json.decode(responInJSON.body);

      return decodeTheJSONtoFlutterMAP;
    } catch (e) {
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("P@kedex"),
      ),
      body: FutureBuilder(
          future: pokeApi(),
          builder: (context, pokeApiReturnData) {
            if (pokeApiReturnData.connectionState == ConnectionState.done) {
              return PokemonList(pokeApiReturnData.data);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

// ignore: must_be_immutable
class PokemonList extends StatefulWidget {
  final pokedexResult;
  PokemonList(this.pokedexResult);
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String urlBuatFoto(int pokedexIndex) {
    String url =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokedexIndex.png";

    return url;
  }

  String n = '';
  @override
  Widget build(BuildContext context) {
    List<String> x = [];
    if (n.isNotEmpty) {
      for (int index = 0;
          index < widget.pokedexResult['results'].length;
          index++) {
        if (widget.pokedexResult['results'][index]['name']
            .toString()
            .contains(n)) {
          x.add(widget.pokedexResult['results'][index]['name']);
        }
      }
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'search'),
                onChanged: (value) {
                  setState(() {
                    n = value.toString();
                    print(n);
                  });
                },
              ),
              n.isEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            return Navigator.pushNamed(
                                context, '/detailPokemon',
                                arguments: widget.pokedexResult['results']
                                    [index]['name']);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                border:
                                    Border.all(width: 5.0, color: Colors.blue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                widget.pokedexResult['results'][index]['name'],
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ))
                              //     Image.network(

                              //   urlBuatFoto(index),
                              //   width: 150,
                              //   height: 150,

                              // )
                              ),
                        );
                      },
                      itemCount: widget.pokedexResult["results"].length,
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            return Navigator.pushNamed(
                                context, '/detailPokemon',
                                arguments: x[index]);
                          },
                          child: Container(
                              child: Center(
                                  child: Text(
                            x[index],
                            style: TextStyle(fontSize: 28),
                          ))
                              //     Image.network(

                              //   urlBuatFoto(index),
                              //   width: 150,
                              //   height: 150,

                              // )
                              ),
                        );
                      },
                      itemCount: x.length,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
