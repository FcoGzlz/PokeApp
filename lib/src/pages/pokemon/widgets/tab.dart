import 'package:flutter/material.dart';
import 'package:pokedex/src/models/pokemon.dart';
import 'package:pokedex/src/pages/pokemon/widgets/tab_about.dart';
import 'package:pokedex/src/pages/pokemon/widgets/tab_evolutions.dart';
import 'package:pokedex/src/pages/pokemon/widgets/tab_moves.dart';
import 'package:pokedex/src/pages/pokemon/widgets/tab_stats.dart';
import 'package:pokedex/src/utils/AppColors.dart';

class PokemonTabInfo extends StatefulWidget {
  Pokemon pokemon;
  PokemonTabInfo(this.pokemon);
  @override
  _PokemonTabInfoState createState() => _PokemonTabInfoState();
}

class _PokemonTabInfoState extends State<PokemonTabInfo> {
  List<String> _tabs = [
    'About',
    'Stats',
    'Evolutions',
    'Moves'
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTabBar(),
            _buildTabContent(widget.pokemon)

          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.grey,
      labelPadding: EdgeInsets.symmetric(vertical: 15),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2,
      indicatorColor: AppColors.indigo,
      tabs: _tabs.map((item) => Text(item)).toList()
    );
  }

  Widget _buildTabContent(Pokemon pokemon) {
    return Expanded(
      child: TabBarView(
        children: <Widget>[
          //recordar que no pueden ser más de 4 widgets en este tabbarview
          //ya que el tabcontroller controla la cantidad de tabs entre otras cosas
          PokemonAbout(pokemon),
          PokemonBaseStats(pokemon),
          PokemonEvolutions(pokemon),
          PokemonMoves(pokemon),
        ],
      ),
    );
  }
}