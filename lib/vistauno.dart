import 'package:flutter/material.dart';
import 'package:tareasmaestras/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tareasmaestras/vistados.dart';

class vistauno extends StatefulWidget{
  vistauno({super.key});

  @override
  State<vistauno> createState() => _vistaunoState();
}

class _vistaunoState extends State<vistauno> {
  final usuario= TextEditingController();
  final contra= TextEditingController();
  final color=AppMaterial().getlistacolores(3);

  void _mensaje(){
    Fluttertoast.showToast(msg: 'bienvenido',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      textColor: AppMaterial().getlistacolores(1),
      fontSize: 18
    );
    setState(() {
    });
  }

  void validacion(){
    String usu=usuario.text;
    String cla=contra.text;
    if (usu=='felipe' && cla=='1011087053'){
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>vistados()
      )
      );
    }else {
      Fluttertoast.showToast(
        msg: 'Datos incorrectos. Intente nuevamente.',
        gravity: ToastGravity.CENTER,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            height: 2000,
            padding: EdgeInsets.only(top: 150, left: 20, right: 20),
            color: AppMaterial().getlistacolores(1),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Icon(Icons.face_unlock_outlined,
                    size: 100,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    buildTextFormField('usuario', usuario),
                    SizedBox(
                      height: 20,
                    ),
                    buildTextFormField2('contrasena', contra),
          
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: ElevatedButton(
                        child: Text("Ingresar",
                          style: TextStyle(
                            color: Colors.black
                          ),
                        ),
                        onPressed: (){
                          _mensaje();
                          validacion();
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }

  TextFormField buildTextFormField(String txt, TextEditingController datotext){
    return TextFormField(
      controller: datotext,
      decoration: InputDecoration(
        labelText: txt,
        hintText: 'Ingrese su usuario',
        border: OutlineInputBorder(),
      ),
    );
  }

  TextFormField buildTextFormField2(String txt, TextEditingController datotext){
    return TextFormField(
      controller: datotext,
      decoration: InputDecoration(
        labelText: txt,
        hintText: 'Ingrese su contraseña',
        border: OutlineInputBorder(),
      ),
    );
  }
}