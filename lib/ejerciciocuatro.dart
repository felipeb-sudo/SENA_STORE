import 'package:flutter/material.dart';
import 'package:tareasmaestras/material.dart';

class EjercicioCuatro extends StatefulWidget {
  const EjercicioCuatro({Key? key}) : super(key: key);

  @override
  State<EjercicioCuatro> createState() => _perros();
}

class _perros extends State<EjercicioCuatro> {
  String raza = "";
  double precioBase = 0;
  int puestoObtenido = 0;

  final Map<String, double> preciosBase = {
    "PITBULL": 6000000,
    "BULLY": 6500000,
    "ROTTWHILLER": 4000000,
    "LABRADOR RETRIEVER": 3500000,
    "GOLDEN RETRIEVER": 3500000,
    "DOBERMAN": 5000000,
    "DOGO ARGENTINO": 5500000,
  };

  double calcularNuevoValor() {
    if (raza.isEmpty) {
      return 0;
    }
    double aumento = 0;
    switch (puestoObtenido) {
      case 1:
        aumento = precioBase * 1;
        break;
      case 2:
        aumento = 800000;
        break;
      case 3:
        aumento = 200000;
        break;
    }
    return precioBase + aumento;
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
                          Text('PITBULL, '
                              'BULLY, '
                              'ROTTWHILLER, '
                              'DOBERMAN,',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('LABRADOR RETRIEVER, '
                              'GOLDEN RETRIEVER, '
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('DOGO ARGENTINO'
                          ),
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 0, right: 20, top: 10),
                          child: Text('El nombre de las mascotas se de deben ingresar en mayuscula',
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
                  decoration: InputDecoration(labelText: "Raza del perro",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  onChanged: (value) => setState(() {
                    raza = value;
                    precioBase = preciosBase[raza] ?? 0; // Check if breed exists
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: TextField(
                  decoration: InputDecoration(labelText: "Puesto obtenido",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => puestoObtenido = int.parse(value)),
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
                    double nuevoValor = calcularNuevoValor();
                    String mensaje = "**Nuevo valor del perro**\n\n";
                    mensaje += "Raza: " + raza + "\n";
                    mensaje += "Puesto obtenido: " + puestoObtenido.toString() + "\n";
                    mensaje += "Nuevo valor: \$" + nuevoValor.toString();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Resultado",),
                        content: Text(mensaje),
                        backgroundColor: Colors.blue,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
