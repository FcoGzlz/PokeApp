import 'package:flutter/material.dart';
import 'package:pokedex/src/data/tipos.dart';
import 'package:pokedex/src/models/pokemon.dart';
import 'package:pokedex/src/utils/AppColors.dart';

class PokemonEvolutions extends StatefulWidget {
  final Pokemon pokemon;
  PokemonEvolutions(this.pokemon);

  @override
  _PokemonEvolutionsState createState() => _PokemonEvolutionsState();
}

class _PokemonEvolutionsState extends State<PokemonEvolutions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: widget.pokemon.evolutions == null
              ? Center(
                  child: Text('No hay evoluciones'),
                )
              : Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: AppColors.grey, blurRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: widget.pokemon.getColorPrincipal().withOpacity(0.5),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 10,
                        children: _buildEvolutions(widget.pokemon),
                      ),
                    )
                  ],
                )),
    );
  }

  List<Widget> _buildEvolutions(Pokemon pokemon) {
    final List<Widget> evolutions = [];
    for (var evos in pokemon.evolutions) {
        final widgetTemp = Stack(
        children: <Widget>[
          Positioned(
            left: 25,
            top: 25,
            child: Image.asset(
              'assets/images/pokeball.png', color: widget.pokemon.getColorPrincipal(), width: 130,
            ),
          ),
          Positioned(
            left: 40,
            top: 40,
            child: Image.asset(
            evos.pokemon.imagen,width: 100,
            ),
          ),
          Positioned(
            top: 25,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: widget.pokemon.getColorPrincipal(),
              ),
              width: 90,
              child: Text(
                evos.pokemon.nombre,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 137,
            left: 90,
            child: Container(
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: widget.pokemon.getColorPrincipal(),
              ),
              child: Text(
                '${evos.level}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
        ],
      );
      evolutions..add(widgetTemp);
      
      
    }
    return evolutions;
  }
}
