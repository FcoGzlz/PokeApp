
import 'package:flutter/material.dart';
import 'package:pokedex/src/data/pokemons.dart';
import 'package:pokedex/src/pages/pokemon/pokemon_detail_page.dart';
import 'package:pokedex/src/widgets/pokemon_card.dart';
class PokedexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Expanded(
            child: _crearGrid(),
          )
        ],
      ),
    );
  }

  Widget _crearGrid() {
    return GridView.builder(
      itemCount: pokemons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 55),
      itemBuilder: (context,index) => PokemonCard(pokemons[index], pokemons[index].id, (){
        Navigator.pushNamed(context, PokemonDetailPage.routeName, arguments: pokemons[index]);
      }),
    );
  }
}