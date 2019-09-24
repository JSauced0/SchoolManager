import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async'; //Pantalla
import 'dart:core';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart'; // to conver http response into a JSON.

// STATEFUL WIDGET LIFE CYCLE
class crearM extends StatefulWidget {
  crearM() : super();
  @override
  crearModificar createState() => crearModificar();
}

class crearModificar extends State<crearM> {
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
        title: Text("Nuevo Maestro"),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              "Agregar Maestro",
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 5, fontSize: 15),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(decoration: InputDecoration(labelText: "Apellido: ")),
            TextFormField(
              decoration: InputDecoration(labelText: 'Expediente'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Direccion'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Telefono'),
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
