import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedRotation extends StatelessWidget {
  //clase que revise un widget a animar y una animacion
  //que se manejara con un controller
  final Widget child;
  final Animation<double> animation;
  AnimatedRotation({this.child,this.animation,});

  @override
  Widget build(BuildContext context) {
    //como su nombre lo dicel el animatedBuilder nos permite construir la animacion que deseemos
    //en este caso es una rotacion
    return AnimatedBuilder(
      animation: animation,//aqui pasaremos el controlador que entre otras cosas nos entregara la duracion de la animacion
      child: child,
      builder: (context,widget) => Transform.rotate(
        angle: 2 * pi * animation.value,//rotacion completa
        child: widget,
      ),
    );
  }
}