import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pokedex/src/models/pokemon.dart';
import 'package:pokedex/src/utils/AppColors.dart';

class PokemonBaseStats extends StatefulWidget {
  final Pokemon pokemon;
  PokemonBaseStats(this.pokemon);

  @override
  _PokemonBaseStatsState createState() => _PokemonBaseStatsState();
}

class _PokemonBaseStatsState extends State<PokemonBaseStats> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: widget.pokemon.detail == null
            ? Center(
                child: Text('No hay stats'),
              )
            : Column(
                children: <Widget>[
                  Row(
                    children: _buildStats(widget.pokemon),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: AppColors.grey, blurRadius: 2)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lighterGrey,
                    ),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal:0, vertical: 10),
                              child: Text(
                                'Debilidades',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.36,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 155,
                              child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: 3.0,
                                crossAxisSpacing: 2.0,
                                mainAxisSpacing: 10,
                                children: _buildWeaknesses(widget.pokemon),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10,),
                              child: Text(
                                'Fortalezas',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.36,
                              margin: EdgeInsets.only(
                                left: 40,
                              ),
                              height: 155,
                              child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: 3.0,
                                crossAxisSpacing: 2.0,
                                mainAxisSpacing: 10,
                                children: _buildstrengths(widget.pokemon),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //AQUI SE DEBERIA AGREGAR OTRO WIDGET O METODO
                  //PARA CREAR LA SECCION TIPOS FUERTES, DEBILES, ETC
                ],
              ),
      ),
    );
  }

  //NOTAR QUE ESTOY PASANDO UNA LISTA DE WIDGETS YA QUE EL CHILDREN DEL ROW PIDE ESO
  List<Widget> _buildStats(Pokemon pokemon) {
    return [
      //el primer column solo es para mostrar los titulos de cada stat
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'HP',
          ),
          SizedBox(
            height: 10,
          ),
          Text("Attack"),
          SizedBox(
            height: 10,
          ),
          Text("Defense"),
          SizedBox(
            height: 10,
          ),
          Text("Sp Atack"),
          SizedBox(
            height: 10,
          ),
          Text("Sp Defense"),
          SizedBox(
            height: 10,
          ),
          Text("Speed"),
        ],
      ),
      SizedBox(
        width: 10,
      ),
      //Este widget resuelve el mismo conflico que el widget singlechildscrollview
      //pero en este caso resuelve el overflow de pixel pero a la derecha, no abajo
      Flexible(
        child: Column(
          children: <Widget>[
            //este widget es de una libreria externa a flutter
            //sacado desde pub.dev, revisar el import más arriba
            //considere que debe actualizar el archivo pubspec.yaml para que funcione correctamente
            //comando: FLUTTER PACKAGES GET
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              lineHeight: 8.0,
              percent: pokemon.detail.healthPoints / 150,
              progressColor: Colors.green,
              leading: Text('${pokemon.detail.healthPoints}'),
            ),
            SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              lineHeight: 8.0,
              percent: pokemon.detail.atack / 150,
              progressColor: Colors.green,
              leading: Text('${pokemon.detail.atack}'),
            ),
            SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              lineHeight: 8.0,
              percent: pokemon.detail.defense / 150,
              progressColor: Colors.green,
              leading: Text('${pokemon.detail.defense}'),
            ),
            SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              lineHeight: 8.0,
              percent: pokemon.detail.specialAtack / 150,
              progressColor: Colors.green,
              leading: Text('${pokemon.detail.specialAtack}'),
            ),
            SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              lineHeight: 8.0,
              percent: pokemon.detail.specialDefense / 150,
              progressColor: Colors.green,
              leading: Text('${pokemon.detail.specialDefense}'),
            ),
            SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              lineHeight: 8.0,
              percent: pokemon.detail.speed / 150,
              progressColor: Colors.green,
              leading: Text('${pokemon.detail.speed}'),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ];
  }
}

List<Widget> _buildWeaknesses(Pokemon pokemon) {
  final List<Widget> weaknesses = [];
  for (var weak in pokemon.weakAgains) {
      final widgetTemp = ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(4.0),
          child: Text(
            weak.nombre,
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          color: weak.color.withOpacity(0.8),
        ),
      );
      weaknesses..add(widgetTemp);
  }
  return weaknesses;
}

List<Widget> _buildstrengths(Pokemon pokemon) {
  final List<Widget> strengths = [];
  for (var strong in pokemon.strongAgainst) {
      final widgetTemp = ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(4.0),
          child: Text(
            strong.nombre,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: strong.color.withOpacity(0.8),
        ),
      );
      strengths..add(widgetTemp);
  }
  return strengths;
}
