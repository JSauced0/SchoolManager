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

  String expediente;
  String nombre;
  String apellido;
  String direccion; 
  String numero;

   Future crearMaestro() async {     //PERTICION HTTP PARA HACER PUT POST JSON
  var data = {
   "expediente": expediente,
   "nombre": nombre,
   "apellido": apellido,
   "direccion": direccion,
   "numero" : numero,
   "activo": true
};

  var respuesta = await http.post(
      Uri.encodeFull("http://edfloreshz.somee.com/api/maestros/"),
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
        title: Text("Nuevo Maestro"),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Text(
              "Agregar Maestro",
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 5, fontSize: 15),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre'),
              maxLength: 30,
              maxLengthEnforced: true,
               onChanged: (String name){
                setState(() {
                 nombre = name; 
                });
              },
            ),
            TextFormField(decoration: InputDecoration(labelText: "Apellido: "),
            maxLength: 30,
              maxLengthEnforced: true,
             onChanged: (String apell){
                setState(() {
                 apellido = apell; 
                });
              }),
            TextFormField(
              decoration: InputDecoration(labelText: 'Expediente'),
              maxLength: 30,
              maxLengthEnforced: true,
               onChanged: (String expe){
                setState(() {
                 expediente = expe; 
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Direccion'),
              maxLength: 30,
              maxLengthEnforced: true,
               onChanged: (String dir){
                setState(() {
                 direccion = dir; 
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Telefono'),
              maxLength: 10,
              maxLengthEnforced: true,
               onChanged: (String tel){
                setState(() {
                 numero = tel; 
                });
              }
            ),
            RaisedButton(
              child: Text("Agregar"),
              onPressed: () {
                crearMaestro();
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
