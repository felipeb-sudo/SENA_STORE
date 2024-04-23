import 'package:flutter/material.dart';
import 'package:tareasmaestras/material.dart';


class EjercicioTres extends StatefulWidget {
  const EjercicioTres({Key? key}) : super(key: key);

  @override
  State<EjercicioTres> createState() => _AlquilerVehiculoState();
}

class _AlquilerVehiculoState extends State<EjercicioTres> {
  String nombreVehiculo = "";

  int diasAlquiler = 0;
  bool tomarSeguro = false;

  double calcularDescuento(int dias) {
    if (dias >= 3 && dias <= 5) {
      return 0.10;
    } else if (dias >= 6 && dias <= 10) {
      return 0.15;
    } else if (dias > 10) {
      return 0.20;
    }
    return 0;
  }

  double calcularValorTotal(String nombre) {
    if (nombreVehiculo.isEmpty) {
      return 0;
    }
    double precioBase = obtenerPrecioBase(nombreVehiculo);
    double descuento = calcularDescuento(diasAlquiler);
    double valorAlquiler = precioBase * diasAlquiler * (1 - descuento);
    if (tomarSeguro) {
      valorAlquiler += (nombre * diasAlquiler) as double;
    }
    return valorAlquiler;
  }

  double obtenerPrecioBase(String nombre) {
    switch (nombre) {
      case "BMW":
        return 1000000;
      case "AUDI":
        return 2500000;
      case "MERCEDES":
        return 1100000;
      case "TOYOTA":
        return 3000000;
      case "FERRARI":
        return 4500000;
      default:
        return 0;
    }
  }

  void mostrarResultado() {
    double valorTotal = calcularValorTotal();
    String mensaje = "**Alquiler de vehículo**\n\n";
    mensaje += "Vehículo: " + nombreVehiculo + "\n";
    mensaje += "Días de alquiler: " + diasAlquiler.toString() + "\n";
    mensaje += "Valor total: \$" + valorTotal.toString() + "\n";
    mensaje += "Descuento: " + (calcularDescuento(diasAlquiler) * 30).toString() + "%\n";
    mensaje += "Seguro: " + (tomarSeguro ? "Sí" : "No");

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado"),
        content: Text(mensaje),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alquiler de Vehículos")),
      body: SingleChildScrollView(
        child: Container(
          height: 2000,
          color: AppMaterial().getlistacolores(1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 20, top: 10),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('BMW, '
                              'AUDI, ',
                          ),
                          Text('MERCEDES, '
                              'TOYOTA, '
                              'FERRARI'
                          ),
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 0, right: 20, top: 10),
                          child: Text('El nombre de los autos de de deben ingresar en mayuscula',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: TextField(
                  decoration: InputDecoration(labelText: "Nombre del vehículo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  onChanged: (value) => setState(() => nombreVehiculo = value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: TextField(
                  decoration: InputDecoration(labelText: "Días de alquiler",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => diasAlquiler = int.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 110),
                child: Row(
                  children: [
                    Checkbox(
                      value: tomarSeguro,
                      onChanged: (value) => setState(() => tomarSeguro = value!),
                    ),
                    Text('si, tomo el seguro'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Calcular",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  onPressed: mostrarResultado,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

