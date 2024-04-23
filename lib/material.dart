import 'package:flutter/material.dart';

const Color _micolor=Color(0XFF330B6F);
const List<Color>_listacolores=[
  _micolor,Colors.white, Colors.red, Colors.yellow, Colors.grey, Colors.blue, Colors.orange, Colors.pink, Colors.white12, Colors.purple, Colors.redAccent, Colors.amber,
];

class AppMaterial{

  ThemeData tema(){
    return ThemeData(useMaterial3: true,
      colorSchemeSeed:  _listacolores[2]);
  }

  Color getlistacolores(int index){
    if(index>=0 && index<_listacolores.length){
      return _listacolores[index];
    } else {
      return Colors.black;
    }
  }
}