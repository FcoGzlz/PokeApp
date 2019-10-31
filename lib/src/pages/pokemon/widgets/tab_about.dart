import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pokedex/src/models/pokemon.dart';
import 'package:pokedex/src/utils/AppColors.dart';

class PokemonAbout extends StatefulWidget {
  final Pokemon pokemon;
  PokemonAbout(this.pokemon);
  @override
  _PokemonAboutState createState() => _PokemonAboutState();
}

class _PokemonAboutState extends State<PokemonAbout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        padding: EdgeInsets.all(5.0),
        child: widget.pokemon.detail == null 
          ? Center(child: Text('No hay informacion'),)
          : _buildInfo()//NO OLVIDAR QUE ESTO SIRVE PARA VERIFICAR CUANDO NO HAY INFO DEL POKEMON Y LANZA UN ERROR "CALLED ON NULL"
          //HAY QUE HACER LO MISMO PARA CADA TAB CON EL ATRIBUTO ESPECIFICO, EN ESTE CASO ES POKEMON.DETAIL
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Text('${widget.pokemon.detail.description}', textAlign: TextAlign.center,),
        SizedBox(height: 30,),
        _buildAlturaPeso(),
        SizedBox(height: 30,),
        _buildCrianza(),
        SizedBox(height: 30,),
        _buildUbicacion()

      ],
    );
  }

  Widget _buildAlturaPeso() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration:BoxDecoration(
        boxShadow: [BoxShadow(color: AppColors.grey,blurRadius: 20)],
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lighterGrey, 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Altura', style: TextStyle(color: AppColors.grey, fontSize: 18),),
              SizedBox(height: 10,),
              Text('${widget.pokemon.detail.height} cm')

            ],
          ),
          Column(
            children: <Widget>[
              Text('Peso', style: TextStyle(color: AppColors.grey, fontSize: 18),),
              SizedBox(height: 10,),
              Text('${widget.pokemon.detail.weight} kgs')
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCrianza() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Crianza',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Row(
            children: <Widget>[
              Text('Género'),
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),
              Icon(
                MdiIcons.genderMale,
                size: 16,
                color: Colors.indigo,
              ),
             SizedBox(width: MediaQuery.of(context).size.width*0.01,),
             Text('${widget.pokemon.detail.percentMale}%'),
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),
              Icon(
                MdiIcons.genderFemale,
                size: 16,
                color: Colors.pink,
              ),
             SizedBox(width: MediaQuery.of(context).size.width*0.01,),
             Text('${widget.pokemon.detail.percentFemale}%'),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Row(
            children: <Widget>[
              Text('Grupos'),
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),
              Text('${widget.pokemon.detail.eggGroup}')
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

        ],
      ),
    );
  }

  Widget _buildUbicacion() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Ubicación',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            width: double.infinity,//este valor toma todo el ancho que tenga el widget padre, en este caso el Column
            height: 200,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10), //borde circular para la imagen
              image: DecorationImage(
                image: new AssetImage('assets/images/pokemon-map.jpg'),//LA IMAGEN DEBE EXISTER EN LA RUTA SI NO, NO FUNCIONARÁ
                fit: BoxFit.cover,//CUBRE TODO EL ANCHO(WIDTH) Y ALTO(HEIGHT) POSIBLE
              ),
              // shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}