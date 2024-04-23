import 'package:flutter/material.dart';
import 'package:tareasmaestras/material.dart';

class EjercicioCinco extends StatefulWidget {
  const EjercicioCinco({Key? key}) : super(key: key);

  @override
  State<EjercicioCinco> createState() => _notas();
}

class _notas extends State<EjercicioCinco> {
  double notaPeriodo1Materia1 = 0.0;
  double notaPeriodo1Materia2 = 0.0;
  double notaPeriodo1Materia3 = 0.0;
  double notaPeriodo1Materia4 = 0.0;

  double notaPeriodo2Materia1 = 0.0;
  double notaPeriodo2Materia2 = 0.0;
  double notaPeriodo2Materia3 = 0.0;
  double notaPeriodo2Materia4 = 0.0;

  double notaPeriodo3Materia1 = 0.0;
  double notaPeriodo3Materia2 = 0.0;
  double notaPeriodo3Materia3 = 0.0;
  double notaPeriodo3Materia4 = 0.0;

  double notaPeriodo4Materia1 = 0.0;
  double notaPeriodo4Materia2 = 0.0;
  double notaPeriodo4Materia3 = 0.0;
  double notaPeriodo4Materia4 = 0.0;

  double promedioGeneral = 0;
  int cursoActual = 0;

  double calcularPromedio() {
    double total = 0;
    total += notaPeriodo1Materia1 +
        notaPeriodo1Materia2 +
        notaPeriodo1Materia3 +
        notaPeriodo1Materia4;
    total += notaPeriodo2Materia1 +
        notaPeriodo2Materia2 +
        notaPeriodo2Materia3 +
        notaPeriodo2Materia4;
    total += notaPeriodo3Materia1 +
        notaPeriodo3Materia2 +
        notaPeriodo3Materia3 +
        notaPeriodo3Materia4;
    total += notaPeriodo4Materia1 +
        notaPeriodo4Materia2 +
        notaPeriodo4Materia3 +
        notaPeriodo4Materia4;
    return total / 16;

  }

  String obtenerCalificacion(double nota) {
    if (nota >= 4.7) {
      return "E";
    } else if (nota >= 3.9) {
      return "S";
    } else if (nota >= 3) {
      return "A";
    } else if (nota >= 2.9) {
      return "I";
    } else if (nota >= 1.1) {
      return "D";
    } else {
      return "F";
    }
  }
  String promocion(double promedio) {
    double por = calcularPromedio();
    if (por >= 3.7) {
      if (cursoActual == 11) {
        return "Estudiante promovido y PUEDE GRADUARSE";
      } else {
        return "Estudiante promovido al siguiente grado: ${cursoActual + 1}";
      }
    } else {
      return "Estudiante NO PROMOVIDO";
    }
  }

  void mostrarResultado() {
    double promedio = calcularPromedio();
    String mensaje = "**Resultados**\n\n";

    for (int i = 1; i <= 4; i++) {
      mensaje += "Periodo " + i.toString() + ":\n";
      mensaje += "  - Materia 1: " +
          notaPeriodo1Materia1.toString() +
          " (" +
          obtenerCalificacion(notaPeriodo1Materia1) +
          ")\n";
      mensaje += "  - Materia 2: " +
          notaPeriodo2Materia2.toString() +
          " (" +
          obtenerCalificacion(notaPeriodo2Materia2) +
          ")\n";
      mensaje += "  - Materia 3: " +
          notaPeriodo3Materia3.toString() +
          " (" +
          obtenerCalificacion(notaPeriodo3Materia3) +
          ")\n";
      mensaje += "  - Materia 4: " +
          notaPeriodo4Materia4.toString() +
          " (" +
          obtenerCalificacion(notaPeriodo4Materia4) +
          ")\n";
    }

    mensaje += "\nPromedio general: " + promedio.toStringAsFixed(2) + "\n";
    mensaje += "Calificación literal: " + obtenerCalificacion(promedio) + "\n";
    mensaje += "" + promocion(promedio);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Resultados"),
          content: Text(mensaje),
          backgroundColor: Colors.blue,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notas del estudiante")),
      body: SingleChildScrollView(
        child: Container(
            height: 2000,
            color: AppMaterial().getlistacolores(1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Grado",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => cursoActual = int.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text("PERIODO 1"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 1",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo1Materia1 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 2",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo1Materia2 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 3",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo1Materia3 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 4",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo1Materia4 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text("PERIODO 2"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 1",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo2Materia1 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 2",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo2Materia2 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 3",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo2Materia3 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 4",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo2Materia4 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text("PERIODO 3"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 1",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo3Materia1 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 2",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo3Materia2 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 3",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo3Materia3 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 4",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo3Materia4 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text("PERIODO 4"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 1",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo4Materia1 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 2",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo4Materia2 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 3",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo4Materia3 = double.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "Materia 4",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => notaPeriodo4Materia4 = double.parse(value)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: ElevatedButton(
                  child: Text("Calcular",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  onPressed: () {
                    calcularPromedio();
                    mostrarResultado();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}