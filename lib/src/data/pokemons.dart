

import 'package:pokedex/src/data/evolutions.dart';
import 'package:pokedex/src/data/moves.dart';
import 'package:pokedex/src/data/pokemons_detail.dart';
import 'package:pokedex/src/data/tipos.dart';
import 'package:pokedex/src/models/pokemon.dart';

//CONSIDERE CREAR LA DATA PREVIAMENTE ANTES DE AGREGARLA A UN OBJETO DE LA CLASE POKEMON

Pokemon bulbasaur = Pokemon(id: 1, nombre: "Bulbasaur", imagen: "assets/images/bulbasaur.png", tipos: [planta, veneno], detail: bulbasaurDet, evolutions: [bulbasaurFirst, bulbasaurSecond], moves:[latigoCepa,hojaAfilada, drenadoras, polvoVeneno], weakAgains: [fuego, hielo, volador, psiquico], strongAgainst: [agua, roca, tierra, hada] );//AGREGAR TANTOS ATRIBUTOS SEA NECESARIO
Pokemon ivysaur = Pokemon(id: 2, nombre: "Ivysaur", imagen: "assets/images/ivysaur.png", tipos: [planta, veneno],detail: ivysaurDet, moves: [rayoSolar,sintesis,derribo,dulceAroma], evolutions: [ivysaurFirst], weakAgains: [fuego, hielo, volador, psiquico], strongAgainst: [agua, roca, tierra, hada]);
Pokemon venusaur = Pokemon(id: 3, nombre: "Venusaur", imagen: "assets/images/venusaur.png", tipos: [planta, veneno],detail: venusaurDet, moves:[latigoCepa,sintesis,hojaAfilada,dulceAroma], weakAgains: [fuego, hielo, volador, psiquico], strongAgainst: [agua, roca, tierra, hada]);
Pokemon charmander = Pokemon(id: 4, nombre: "Charmander", imagen: "assets/images/charmander.png", tipos: [fuego],detail: charmanderDet, moves: [ascuas,furiaDragon,colmilloIgneo,infierno], evolutions: [charmanderFirst, charmanderSecond], weakAgains: [agua, roca, tierra], strongAgainst: [planta, hielo, bicho]);
Pokemon charmeleon = Pokemon(id: 5, nombre: "Charmeleon", imagen: "assets/images/charmeleon.png", tipos: [fuego], detail:charmeleonDet ,moves: [ascuas,furiaDragon,colmilloIgneo,garraMetal], evolutions: [charmeleaonFirst], weakAgains: [agua, roca, tierra], strongAgainst: [planta, hielo, bicho]);
Pokemon charizard = Pokemon(id: 6, nombre: "Charizard", imagen: "assets/images/charizard.png", tipos: [fuego, volador],detail: charizardDet, moves: [lanzallamas,furiaDragon,colmilloIgneo,ataqueAla], weakAgains: [agua, roca, tierra, electrico], strongAgainst: [planta, hielo, lucha, bicho]);
Pokemon squirtle = Pokemon(id: 7, nombre: "Squirtle", imagen: "assets/images/squirtle.png", tipos: [agua],detail: squirtleDet, moves: [pistolaAgua,proteccion,cabezazo,danzaLluvia], evolutions: [squirtleFirst, squirtleSecond], weakAgains: [planta, electrico], strongAgainst: [tierra, roca, fuego]);
Pokemon wartortle = Pokemon(id: 8, nombre: "Wartortle", imagen: "assets/images/wartortle.png", tipos: [agua],detail: wartortleDet, moves: [hidropulso,proteccion,cabezazo,danzaLluvia],evolutions: [wartorleFirst], weakAgains: [planta, electrico], strongAgainst: [tierra, roca, fuego]);
Pokemon blastoise = Pokemon(id: 9, nombre: "Blastoise", imagen: "assets/images/blastoise.png", tipos: [agua], detail: blastoiseDet,moves: [hidrobomba,proteccion,cabezazo,danzaLluvia], weakAgains: [planta, electrico], strongAgainst: [tierra, roca, fuego]);
Pokemon pikachu = Pokemon(id: 25, nombre: "Pikachu", imagen: "assets/images/pikachu.png", tipos: [electrico], detail: pikachuDet,moves:[chispa,bolaVoltio,ataqueRapido,atizar], weakAgains: [tierra], strongAgainst: [agua, volador]);


List<Pokemon> pokemons = [
      bulbasaur,
      ivysaur,
      venusaur,
      charmander,
      charmeleon,
      charizard,
      squirtle,
      wartortle,
      blastoise,
      pikachu,
];