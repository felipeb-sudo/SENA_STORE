import 'package:flutter/material.dart';
import 'package:tareasmaestras/material.dart';

class EjercicioDos extends StatefulWidget {
  EjercicioDos({Key? key}) : super(key: key);

  @override
  State<EjercicioDos> createState() => _SalarioPageState();
}


class _ResultadoSalario extends StatelessWidget {
  final double salarioBasico;
  final double pagoHorasExtras;
  final double descuentoSalud;
  final double descuentoPension;
  final double salarioFinal;

  const _ResultadoSalario({
    Key? key,
    required this.salarioBasico,
    required this.pagoHorasExtras,
    required this.descuentoSalud,
    required this.descuentoPension,
    required this.salarioFinal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalDescuentos = descuentoSalud + descuentoPension;
    return Column(
      children: [
        Text("Salario básico: \$" + salarioBasico.toString()),
        Text("Pago horas extras: \$" + pagoHorasExtras.toString()),
        Text("Descuento salud: \$" + descuentoSalud.toString()),
        Text("Descuento pensión: \$" + descuentoPension.toString()),
        Text("Salario final: \$" + salarioFinal.toString()),
      ],
    );
  }
}

class _SalarioPageState extends State<EjercicioDos> {
  double salarioBasico = 0;
  int horasExtrasDiurnas = 0;
  int horasExtrasNocturnas = 0;
  int horasExtrasFestivas = 0;
  int horasExtrasDominicales = 0;
  int diasPerdidos = 0;
  late double valorHoraNormal;

  double calcularSalario() {
    double salarioBruto = salarioBasico;

    valorHoraNormal = salarioBasico / 240;
    double pagoHorasExtras = 0;

    pagoHorasExtras += horasExtrasDiurnas * valorHoraNormal * 1.25;
    pagoHorasExtras += horasExtrasNocturnas * valorHoraNormal * 1.35;
    pagoHorasExtras += horasExtrasFestivas * valorHoraNormal * 1.75;
    pagoHorasExtras += horasExtrasDominicales * valorHoraNormal * 2;

    salarioBruto += pagoHorasExtras;

    if (diasPerdidos > 0) {
      double descuentoDiasPerdidos = salarioBasico / 30 * diasPerdidos;
      salarioBruto -= descuentoDiasPerdidos;
    }

    double descuentoSalud = salarioBruto * 0.04;
    double descuentoPension = salarioBruto * 0.04;

    double salarioFinal = salarioBruto - descuentoSalud - descuentoPension;

    return salarioFinal;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Calcular Salario")),
      body: SingleChildScrollView(
        child: Container(
          height: 2000,
          color: AppMaterial().getlistacolores(1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: TextField(
                  decoration: InputDecoration(labelText: "Salario básico",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  onChanged: (value) => salarioBasico = double.parse(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextField(
                  decoration: InputDecoration(labelText: "Horas extras diurnas",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  onChanged: (value) => horasExtrasDiurnas = int.parse(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextField(
                  decoration: InputDecoration(labelText: "Horas extras nocturnas",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  onChanged: (value) => horasExtrasNocturnas = int.parse(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextField(
                  decoration: InputDecoration(labelText: "Horas extras festivas",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  onChanged: (value) => horasExtrasFestivas = int.parse(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextField(
                  decoration: InputDecoration(labelText: "Horas extras dominicales",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  onChanged: (value) => horasExtrasDominicales = int.parse(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextField(
                  decoration: InputDecoration(labelText: "Días perdidos",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  onChanged: (value) => diasPerdidos = int.parse(value),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: ElevatedButton(
                  onPressed: () {
                    double salarioFinal = calcularSalario();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Salario Final"),
                        content: _ResultadoSalario(
                          salarioBasico: salarioBasico,
                          pagoHorasExtras: calcularPagoHorasExtras(),
                          descuentoSalud: salarioFinal * 0.04,
                          descuentoPension: salarioFinal * 0.04,
                          salarioFinal: salarioFinal,
                        ),
                        backgroundColor: Colors.blue,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Calcular",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calcularPagoHorasExtras() {
    double pagoHorasExtras = 0;
    pagoHorasExtras += horasExtrasDiurnas * valorHoraNormal * 1.25;
    pagoHorasExtras += horasExtrasNocturnas * valorHoraNormal * 1.35;
    pagoHorasExtras += horasExtrasFestivas * valorHoraNormal * 1.75;
    pagoHorasExtras += horasExtrasDominicales * valorHoraNormal * 2;
    return pagoHorasExtras;
  }
}
