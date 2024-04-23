import 'package:flutter/material.dart';
import 'package:tareasmaestras/material.dart';

class EjercicioUno extends StatefulWidget {
  EjercicioUno({Key? key}) : super(key: key);

  @override
  State<EjercicioUno> createState() => _EstacionamientoPageState();
}

class _EstacionamientoPageState extends State<EjercicioUno> {
  double horas = 0;
  double minutos = 0;

  double calcularCosto() {
    int fraccion = 0;
    if (minutos > 0){
      fraccion = 1;
    }
    double totalHoras = (horas + fraccion)* 1500;
    double costo = totalHoras;
    return costo;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Estacionamiento")),
      body: SingleChildScrollView(
        child: Container(
          height: 2000,
          color: AppMaterial().getlistacolores(1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
                child: TextField(
                  decoration: InputDecoration(labelText: "Horas",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  onChanged: (value) => horas = double.parse(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextField(
                  decoration: InputDecoration(labelText: "Minutos",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  onChanged: (value) => minutos = double.parse(value),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: ElevatedButton(
                    onPressed: () {
                      double costo = calcularCosto();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Resultado"),
                          content: Text("Costo total: \$$costo"),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text("Calcular",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

