import 'package:flutter/material.dart';
import 'package:pokedex/src/models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  Pokemon pokemon;
  int id;
  Function onPress;

  TextStyle estiloNombre =
      TextStyle(color: Colors.white, fontSize: 16, shadows: [
    Shadow(color: Colors.black, offset: Offset(-0.5, -0.5)),
  ]);

  PokemonCard(this.pokemon, this.id, this.onPress);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: pokemon.getColorPrincipal().withOpacity(0.5),
        onTap: onPress,
        child: Card(
          color: pokemon.getColorPrincipal(),
          shape: RoundedRectangleBorder(),
          child: _cardDetail(),
        ),
      ),
    );
  }

  Widget _cardDetail() {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Image.asset(
            'assets/images/pokeball.png',
            height: 125,
            width: 125,
            color: Colors.white.withOpacity(0.14),
          ),
          bottom: -15,
          right: -15,
        ),
        Positioned(
          child: Image.asset(
            pokemon.imagen,
            height: 80,
            width: 80,
          ),
          bottom: 10,
          right: 10,
        ),
        Positioned(
          child: Text(
            pokemon.nombre,
            style: estiloNombre,
          ),
          top: 8,
          left: 5,
        ),
        Align(
          child: Text(
            '#00${pokemon.id}',
            style: TextStyle(color: Colors.black38, fontSize: 14),
          ),
          alignment: Alignment(0.9, -0.9),
        ),
        Align(
          alignment: Alignment(-0.9, 0.9),
          child: Wrap(
            children: _buildTipos(),
            direction: Axis.vertical,
          ),
        )
      ],
    );
  }

  List<Widget> _buildTipos() {
    final List<Widget> tipos = [];
    for (var tipo in pokemon.tipos) {
      final widgetTemp = ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Text(tipo.nombre, style: TextStyle(color: Colors.white, fontSize: 12),),
          color: Colors.white.withOpacity(0.2),
        ),
      );
      tipos..add(widgetTemp)
            ..add(SizedBox(height:5));
      
    }
    return tipos;
  }
}
