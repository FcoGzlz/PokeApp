import 'package:flutter/material.dart';
import 'package:pokedex/src/models/pokemon.dart';
import 'package:pokedex/src/utils/AppColors.dart';

class PokemonMoves extends StatefulWidget {
  final Pokemon pokemon;
  PokemonMoves(this.pokemon);
  @override
  _PokemonMovesState createState() => _PokemonMovesState();
}

class _PokemonMovesState extends State<PokemonMoves> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: widget.pokemon.moves == null
            ? Center(
                child: Text('No hay informacion'),
              )
            : Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: GridView.count(
                            crossAxisCount: 1,
                            childAspectRatio: 5.0,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 1.0,
                            children: _buildMoves(widget.pokemon),
                          ),
                      ),
                      
                    ],
                  )
                ],
              ),
      ),
    );
  }

  List<Widget> _buildMoves(Pokemon pokemon) {
    final List<Widget> moves = [];
    for (var move in pokemon.moves) {
      final widgetTemp = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Container(
              color: pokemon.getColorPrincipal().withOpacity(0.6),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          move.nombre,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: move.tipo.color,
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: Text(
                              move.tipo.nombre,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.grey,
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: Text(
                              move.categoria,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        child: Text(
                          'Potencia',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                        child: Text(
                          move.potencia,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                        child: Text(
                          'Presición'
                        ),
                      ),
                      Container(
                        child: Text(
                          move.presicion,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),

                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      moves..add(widgetTemp);
    }
    return moves;
    // return [
    //    Row(
    //     children: moves,
    //   ),
    //   Column(
    //     children:
    //       _buildTipoPotencia(widget.pokemon),
    //   ),

    // ];
  }
}
