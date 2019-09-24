import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'package:school_manager_app/editarCrear/grupoModificar.dart';
import 'dart:async';
import 'dart:convert'; // to conver http response into a JSON.
import 'dart:core';
import 'crear/crearG.dart';
// DATOS QUE SE USARAN EN UNA CLASE EXTERNA PARA PARSEAR UN JSON ARRAY

class GruposList extends StatefulWidget {
  @override
  _GrupoRender createState() => _GrupoRender();
}

class _GrupoRender extends State<GruposList> {
  Map data;
  List userData;

  Future getData() async {
    http.Response response =
        await http.get("http://edfloreshz.somee.com/api/grupos");
    data = json.decode(response.body);
    setState(() {
      userData = data["grupos"];
    });
  }

 //Moverme a editar Grupo
 void grupoMove(BuildContext context, int index){
    Navigator.push(
      context, new MaterialPageRoute(
        builder: (BuildContext context) => 
          new grupoModificar("${userData[index]["id"]}"," ${userData[index]["nombre"]}",
          "${userData[index]["grado"]}",("${userData[index]["activo"]}"))
        
      ));
  } 


  void crearGrupo() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) => new crearG()));
  }
//Inicio ciclo de vida Stateful y Obtencion APi
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grupos"), // Titulo de la barra inicial
          backgroundColor: Colors.lightBlue,
        ),
        body: ListView.builder(
            itemCount: userData == null ? 0 : userData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: new InkWell(
                onTap: () {
                  grupoMove(context, index);
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
                            "Grado: " +
                            "${userData[index]["grado"]}")),
                  ],
                ),
              ));
            }),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            crearGrupo();
          },
          label: Text('Agregar Grupo'),
          icon: Icon(Icons.library_add),
          backgroundColor: Colors.pink,
        ));
  }
}
