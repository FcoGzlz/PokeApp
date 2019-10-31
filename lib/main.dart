import 'package:flutter/material.dart';
import 'package:pokedex/src/pages/pokedex/pokedex_page.dart';
import 'package:pokedex/src/pages/pokemon/pokemon_detail_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        
      ),
      title: 'Pokedex App',
      initialRoute: '/',
      routes: <String,WidgetBuilder>{
        '/' : (context) => PokedexPage(),
        PokemonDetailPage.routeName : (context) => PokemonDetailPage() 
      },
    );
  }
}