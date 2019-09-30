import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async'; //Pantalla
import 'dart:core';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart'; // to conver http response into a JSON.

// STATEFUL WIDGET LIFE CYCLE
class crearA extends StatefulWidget {
  crearA() : super();
  @override
  crearAodificar createState() => crearAodificar();
}

class crearAodificar extends State<crearA> {
  bool isSwitched = true;
  cambiarActividad() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  String exped = "5548512S";
  String nombre = "Dimitriii";
  int grupo = 2;

  Future crearAlumno() async {     //PERTICION HTTP PARA HACER PUT POST JSON
        var data = {
        "expediente": exped,
        "nombre": nombre,
        "grupo": grupo,
        "activo": true
      };

        var respuesta = await http.post(
            Uri.encodeFull("http://edfloreshz.somee.com/api/alumnos/"),
            body:json.encode(data),
            headers: {
              "content-type": "application/json",
              "accept": "application/json",
            });
        print(respuesta.statusCode);
        print(respuesta.body);
        //debugPrint(data.toString())
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificacion Alumno"),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Text(
              "Agregar Alumno",
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 5, fontSize: 15),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre'),
              maxLength: 40,
              maxLengthEnforced: true,
              onChanged: (String str){
                setState(() {
                  nombre = str;
                });
              },
            ),
            TextFormField(decoration: InputDecoration(labelText: "Grupo: "),
             keyboardType: TextInputType.number,
              onChanged: (String gp){
                setState(() {
                 grupo = int.parse(gp); 
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Expediente'),
              maxLength: 10,
              maxLengthEnforced: true,
              onChanged: (String ex){
                setState(() {
                 exped = ex; 
                });
              },
            ),
            RaisedButton(
              child: Text("Agregar"),
              onPressed: () {
                crearAlumno();
              },
              color: Colors.green,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
