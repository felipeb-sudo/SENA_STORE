import 'package:flutter/material.dart';
import 'package:tareasmaestras/material.dart';
import 'package:tareasmaestras/ejerciciouno.dart';
import 'package:tareasmaestras/ejerciciodos.dart';
import 'package:tareasmaestras/ejerciciotres.dart';
import 'package:tareasmaestras/ejerciciocuatro.dart';
import 'package:tareasmaestras/ejerciciocinco.dart';
import 'package:tareasmaestras/vistauno.dart';

class vistados extends StatefulWidget{
  vistados({super.key});

  @override
  State<vistados> createState() => _vistadosState();
}

class _vistadosState extends State<vistados> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(title: Text("Ejercicios")),
        body:Container(
        color: AppMaterial().getlistacolores(1),
          child: Column(
            children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10, top: 120),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          margin: EdgeInsets.only(left: 5),
                          child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>EjercicioUno())
                            );
                          },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              child: Text('Estacion',
                                style: TextStyle(
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),
                        Container(
                          height: 40,
                          width: 100,
                          margin:EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>EjercicioDos())
                              );
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            child: Text('Salario',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          margin:EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>EjercicioTres())
                              );
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            child: Text('Alquiler',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        )
                      ],
                   ),
                  ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>EjercicioCuatro())
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: Text('Perros',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      margin:EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>EjercicioCinco())
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: Text('Notas',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      margin:EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>vistauno())
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: Text('Devolver',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}