import 'package:flutter/material.dart';
import 'package:pokedex/src/models/evolution.dart';
import 'package:pokedex/src/models/move.dart';
import 'package:pokedex/src/models/pokedetail.dart';
import 'package:pokedex/src/models/tipo.dart';

class Pokemon{
  int id;
  String nombre;
  String imagen;
  PokeDetail detail;
  List<Tipo> tipos;
  List<Evolution> evolutions;
  List<Move> moves;
  List<Tipo> weakAgains;
  List<Tipo> strongAgainst;
  //agregar atributos de acuerdo a lo que necesita cada TABVIEW
  //y luego pasarlos al constructor
  Pokemon({
    this.id,
    this.nombre,
    this.imagen,
    this.detail,
    this.tipos,
    this.evolutions,
    this.moves,
    this.weakAgains,
    this.strongAgainst
  });

  Color getColorPrincipal(){
    return this.tipos.elementAt(0).color;
  }


}