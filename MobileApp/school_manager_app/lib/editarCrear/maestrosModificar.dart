import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async'; //Pantalla
import 'dart:core';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart'; // to conver http response into a JSON.

// STATEFUL WIDGET LIFE CYCLE
class maestroModificar extends StatefulWidget {
  maestroModificar(this.id, this.nombre, this.apellido, this.direccion,
      this.numero, this.status)
      : super();
  final String id, nombre, apellido, direccion, numero;
  String status;
  @override
  MaestroModificar createState() =>
      MaestroModificar(id, nombre, apellido, direccion, numero, status);
}


class MaestroModificar extends State<maestroModificar> {
  MaestroModificar(this.id, this.nombre, this.apellido, this.direccion,
      this.numero, this.status)
      : super();
  String id, nombre, apellido, direccion, numero;
  String status;
  bool isSwitched= true;
  cambiarActividad() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  
Future modificarDatos() async {
  //PERTICION HTTP PARA HACER PUT POST JSON
  var data = {
    "id":id,
   "expediente": 3151311,
   "nombre": nombre,
   "apellido": apellido,
   "direccion": direccion,
   "numero" : numero,
   "activo": isSwitched
};

  var respuesta = await http.put(
      Uri.encodeFull("http://edfloreshz.somee.com/api/maestros/${this.id}"),
      body: utf8.encode(json.encode(data)),
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
        title: Text("Modificacion Maestro"),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Text(
              "Nombre : " + "$nombre ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 5, fontSize: 15),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '$nombre'),
              maxLength: 40,
              maxLengthEnforced: true,
               onChanged: (String str){
                setState(() {
                  nombre = str;
                });
              },
            ),
            TextFormField(
                decoration: InputDecoration(labelText: "Apellido: " + '$apellido'),
                maxLength: 40,
              maxLengthEnforced: true,
                 onChanged: (String ape){
                setState(() {
                  apellido = ape;
                });
              }),
                TextFormField(
                decoration: InputDecoration(labelText: "Direccion: " + '$direccion'),
                maxLength: 50,
                maxLengthEnforced: true,
                 onChanged: (String dir){
                setState(() {
                  direccion = dir;
                });
              }),
                TextFormField(
                decoration: InputDecoration(labelText: "Numero: " + '$numero'),
                 maxLength: 10,
              maxLengthEnforced: true,
                 onChanged: (String numero){
                setState(() {
                  numero = numero;
                });
              }),
            Switch(
              value: isSwitched,
              onChanged: (isSwitched) {
                cambiarActividad();
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
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
