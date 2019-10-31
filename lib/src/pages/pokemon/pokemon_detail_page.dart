import 'package:flutter/material.dart';
import 'package:pokedex/src/models/pokemon.dart';
import 'package:pokedex/src/pages/pokemon/widgets/tab.dart';
import 'package:pokedex/src/widgets/animated_rotation.dart';

class PokemonDetailPage extends StatefulWidget {
  static const routeName = '/detail';

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}
//el mixin es similar a una interface en Java
//para este ejemplo este mixin es necesario para poder utilizar la propiedad VSYNC del
//AnimationController que se ve en el initstate() method
class _PokemonDetailPageState extends State<PokemonDetailPage> with SingleTickerProviderStateMixin{
  AnimationController _rotateController;//controlador que manejara la animacion
  //para entender estos 2 metodos a continuacion se debe entender el ciclo de vida de un widget
  //este ciclo de vida es valido generalmente solo para statefulwidget
  //pueden ver un resumen de esto en este link en español: https://rstopup.com/ciclo-de-vida-en-el-flutter.html
  @override
  void initState() {
    //esto se hace al comienzo del ciclo de vida del widget
    //aqui le estamos dando algunos parametros a la animacion, como su duracion y una repeticion
    _rotateController = AnimationController(vsync: this, duration: Duration(milliseconds: 5000));
    _rotateController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _rotateController.dispose();//eliminamos el widget
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Pokemon pokemon = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(pokemon, context),
          SliverFillRemaining(
            fillOverscroll: true,
            child: PokemonTabInfo(pokemon)
          )
        ],
      ),
    );
  }

  Widget _crearAppBar(Pokemon pokemon, BuildContext context) {
    return SliverAppBar(
      floating: false,
      backgroundColor: pokemon.getColorPrincipal(),
      // title: Text(pokemon.nombre),
      elevation: 2.0,
      expandedHeight: MediaQuery.of(context).size.height*0.45,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(pokemon.nombre),
        background: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            //envolvemos el elemento que se quiere animar en el widget personalizado
            //que se creo para la animacion
            //probablemente hay que reaizar un HOT RESTART(BOTON VERDE) ya que podria mostrar un error
            AnimatedRotation(
              animation: _rotateController,
              child: Image.asset(
                'assets/images/pokeball.png',
                color: Colors.white.withOpacity(0.5),
                height: 225,
                width: 225,
              ),
            ),
            Image.asset(
              pokemon.imagen,
              height: 175,
              width: 175,
              // alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}