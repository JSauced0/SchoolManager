import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async';
import 'dart:convert'; // to conver http response into a JSON.
import 'dart:core';
import 'editarCrear/alumnoModificar.dart';
import 'crear/crearA.dart';
// DATOS QUE SE USARAN EN UNA CLASE EXTERNA PARA PARSEAR UN JSON ARRAY

class AlumnosList extends StatefulWidget {
  @override
  _AlumnoRender createState() => _AlumnoRender();
}

class _AlumnoRender extends State<AlumnosList> {
  Map data;
  List userData;
  Future getData() async {
    http.Response response =
        await http.get("http://edfloreshz.somee.com/api/alumnos");
    data = json.decode(response.body);
    setState(() {
          userData = data["alumnos"];
    });
  }
  //Moverme a editar Alumno 
  void alumnoMove(BuildContext context, int index){
    Navigator.push(
      context, new MaterialPageRoute(
        builder: (BuildContext context) => 
          new alumnoModificar("${userData[index]["id"]}"," ${userData[index]["nombre"]}",
          "${userData[index]["grupo"]}",("${userData[index]["activo"]}"))
        
      ));
  } 
  //Moverme a Crear Alumno
  void alumnoCreate(){
    Navigator.push(
      context, new MaterialPageRoute(
        builder: (BuildContext context) => 
          new crearA()
        
      ));
  } 
//Obtencion de datos APi
  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: Text("Alumnos"), // Titulo de la barra inicial
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
               child: new InkWell(
                    onTap: () {
                      alumnoMove(context, index);
                    },
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("id " +
                          "${userData[index]["id"]}" +
                          "\n" +
                          "Nombre: " +
                          " ${userData[index]["nombre"]}" +
                          "\n" +
                          "Grupo: " +
                          "${userData[index]["grupo"]}")),
                ],
              ),
            ));
          }),
          floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          alumnoCreate();
        },
        label: Text('Agregar Alumno'),
        icon: Icon(Icons.person_add),
        backgroundColor: Colors.blueGrey,
      )
    );
  }
}
