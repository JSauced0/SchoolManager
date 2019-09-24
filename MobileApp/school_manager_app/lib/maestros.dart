import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async';
import 'dart:convert'; // to conver http response into a JSON.
import 'dart:core';
import 'crear/crearM.dart';
import 'editarCrear/maestrosModificar.dart';

// DATOS QUE SE USARAN EN UNA CLASE EXTERNA PARA PARSEAR UN JSON ARRAY

class MaestrosList extends StatefulWidget {
  @override
  _MaestrosRender createState() => _MaestrosRender();
}

class _MaestrosRender extends State<MaestrosList> {
  Map data;
  List userData;
  Future getData() async {
    http.Response response =
        await http.get("http://edfloreshz.somee.com/api/maestros");
    data = json.decode(response.body);

    setState(() {
      userData = data["maestros"];
    });
  }
    // Moverme a editar Maestro
     void maestroMove(BuildContext context, int index){
    Navigator.push(
      context, new MaterialPageRoute(
        builder: (BuildContext context) => 
          new maestroModificar("${userData[index]["id"]}"," ${userData[index]["nombre"]}",
          "${userData[index]["apellido"]}","${userData[index]["direccion"]}","${userData[index]["numero"]}","${userData[index]["activo"]}")
        
      ));
  } 

  //Moverme a crear maestro
  void maestroCreate() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) => new crearM()));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maestros"), // Titulo de la barra inicial
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: new InkWell(
              onTap: () {
                 maestroMove(context, index);
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
                          "Numero: " +
                          "${userData[index]["numero"]}")),
                ],
              ),
            ));
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          maestroCreate();
        },
        label: Text('Agregar Maestros'),
        icon: Icon(Icons.bookmark),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
