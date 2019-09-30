import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async'; //Pantalla
import 'dart:core';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart'; // to conver http response into a JSON.

// STATEFUL WIDGET LIFE CYCLE
class alumnoModificar extends StatefulWidget {
  alumnoModificar(this.id, this.expediente,this.nombre, this.grupo, this.status) : super();
  String id, nombre, expediente;
  String grupo;
  String status;
  @override
  AlumnoModificar createState() => AlumnoModificar(id,expediente,nombre, grupo, status);
}



class AlumnoModificar extends State<alumnoModificar> {

  AlumnoModificar(this.id,this.expediente, this.nombre, this.grupo, this.status) : super();
  String id, expediente,nombre;
  String grupo;
  String status;
  bool isSwitched= true;
  cambiarActividad() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  Future modificarDatos() async {     //PERTICION HTTP PARA HACER PUT POST JSON
  var data = {
   "id":id,
   "expediente": expediente ,
   "nombre": nombre,
   "grupo": int.parse(grupo),
   "activo": isSwitched
};

  var respuesta = await http.put(
      Uri.encodeFull("http://edfloreshz.somee.com/api/alumnos/${this.id}"),
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
              "Nombre : " + "$nombre ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 5, fontSize: 15),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '$nombre'),
              onChanged: (String str){
                setState(() {
                  nombre = str;
                });
              },
            ),
            TextFormField(
                decoration: InputDecoration(labelText: "Grupo: " + '$grupo'),
                keyboardType: TextInputType.number,
                onChanged: (String str){
                setState(() {
                  grupo = str;
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
