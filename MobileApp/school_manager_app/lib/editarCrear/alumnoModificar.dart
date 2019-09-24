import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async'; //Pantalla
import 'dart:core';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart'; // to conver http response into a JSON.

// STATEFUL WIDGET LIFE CYCLE
class alumnoModificar extends StatefulWidget {
  alumnoModificar(this.id, this.nombre, this.grupo, this.status) : super();
  final String id, nombre, grupo;
  String status;
  @override
  AlumnoModificar createState() => AlumnoModificar(id, nombre, grupo, status);
}

Future modificarDatos() async {     //PERTICION HTTP PARA HACER PUT POST JSON
  var data = {
    "id": 3,
    "expediente": "1250202068",
    "nombre": "Eduardo Flores",
    "grupo": 2,
    "activo": true,
    "grupoNavigation": {
      "id": 2,
      "nombre": "1-A",
      "grado": 1,
      "maestro": 1,
      "activo": true,
      "gradoNavigation": {
        "id": 1,
        "grado": "1ro",
        "asignaciones": [],
        "grupos": []
      },
      "maestroNavigation": {
        "id": 1,
        "expediente": "125634942",
        "nombre": "Javier",
        "apellido": "Lopez",
        "direccion": "No",
        "numero": "66321455",
        "activo": true,
        "grupos": []
      },
      "alumnos": [
        {
          "id": 63,
          "expediente": "1602022006",
          "nombre": "Jesus Saucedo",
          "grupo": 2,
          "activo": true
        }
      ]
    }
  };

  var respuesta = await http.put(
      Uri.encodeFull("http://edfloreshz.somee.com/api/alumnos/"),
      body: utf8.encode(json.encode(data)),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      });
  print(respuesta.statusCode);
  print(respuesta.body);
  //debugPrint(data.toString())
}

class AlumnoModificar extends State<alumnoModificar> {
  AlumnoModificar(this.id, this.nombre, this.grupo, this.status) : super();
  final String id, nombre, grupo;
  String status;
  bool isSwitched = true;
  cambiarActividad() {
    setState(() {
      isSwitched = !isSwitched;
    });
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
        child: Column(
          children: <Widget>[
            Text(
              "Nombre : " + "$nombre ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 5, fontSize: 15),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '$nombre'),
            ),
            TextFormField(
                decoration: InputDecoration(labelText: "Grupo: " + '$grupo')),
            Switch(
              value: isSwitched,
              onChanged: (isSwitched) {
                cambiarActividad();
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
            Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.display1.fontSize * 1.1 +
                      200.0,
                ),
                color: Color.fromARGB(15, 15, 154, 6),
                padding: EdgeInsets.all(62.0),
                child: Text(
                  "id " +
                      "$id" +
                      "\n" +
                      "\n" +
                      "\n" +
                      "Grupo: " +
                      "$grupo" +
                      "\n" +
                      "\n" +
                      "\n" +
                      "Estatus : " +
                      "$isSwitched",
                )),
            RaisedButton(
              child: Text("Guardar"),
              onPressed: () {
                modificarDatos(); //manda post put json.
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
