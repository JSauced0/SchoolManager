import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async';
import 'dart:convert'; // to conver http response into a JSON.
import 'dart:core';
import 'main.dart';

// DATOS QUE SE USARAN EN UNA CLASE EXTERNA PARA PARSEAR UN JSON ARRAY

class MaestrosList extends StatelessWidget{

  Map data;
  List userData;
  Future getData() async {
    http.Response response =
        await http.get("http://edfloreshz.somee.com/api/maestros");
    data = json.decode(response.body);
     userData = data["maestros"]; 
  }

  
    @override
  Widget build(BuildContext context) {
    
    return
     Scaffold(
        appBar: AppBar(
          title: Text("Maestros"), // Titulo de la barra inicial
          backgroundColor: Colors.lightBlue,
        ),
        body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("id "+"${userData[index]["id"]}"+"\n"+"Nombre: "+" ${userData[index]["nombre"]}"+"\n"+"Grupo: "+"${userData[index]["numero"]}")
                ),          
              ],
            ),
          );
        }),
        );
  }
  
  }


