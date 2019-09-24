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
              "Agregar Alumno",
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 5, fontSize: 15),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(decoration: InputDecoration(labelText: "Grupo: ")),
            TextFormField(
              decoration: InputDecoration(labelText: 'Expediente'),
            ),
            RaisedButton(
              child: Text("Agregar"),
              onPressed: () {},
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
