import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async'; //Pantalla
import 'dart:core';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart'; // to conver http response into a JSON.

// STATEFUL WIDGET LIFE CYCLE
class crearG extends StatefulWidget {
  crearG() : super();
  @override
  creargModificar createState() => creargModificar();
}

class creargModificar extends State<crearG> {
  bool isSwitched = true;
  cambiarActividad() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  String nombre = "5548512S";
  int grado = 1;
  int maestro = 2;
  

   Future crearGrupo() async {     //PERTICION HTTP PARA HACER PUT POST JSON
  var data = {
   "nombre": nombre,
   "grado": grado,
   "maestro": maestro,
   "activo": true
};

  var respuesta = await http.post(
      Uri.encodeFull("http://edfloreshz.somee.com/api/grupos/"),
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
        title: Text("Crear Grupo"),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Text(
              "Crear Grupo",
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 5, fontSize: 15),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre: '),
              maxLength: 4,
              maxLengthEnforced: true,
                onChanged: (String ngr){
                setState(() {
                 nombre = ngr; 
                });
              },
            ),
            TextFormField(decoration: InputDecoration(labelText: "Grado: "),
            keyboardType: TextInputType.number,
            onChanged: (String grad){
                setState(() {
                 grado = int.parse(grad); 
                });
              }),  
            TextFormField(
              decoration: InputDecoration(labelText: 'Maestro :'),
              keyboardType: TextInputType.number,
               onChanged: (String maester){
                setState(() {
                 maestro = int.parse(maester); 
                });
              },
            ),
            RaisedButton(
              child: Text("Agregar"),
              onPressed: () {
                crearGrupo();
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
