import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;  // Para manejar Peticiones HTTP
import 'dart:async';
import 'dart:convert';  // to conver http response into a JSON.


// Metodo Principal que manda a llamar a Stateful Widget
void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

// Homepage Class que manda a llamar a _Home Page State
class HomePage extends StatefulWidget {
  @override 
  _HomePageState createState() => _HomePageState();
 }

// Aqui es donde la accion ocurre
 class _HomePageState extends State<HomePage> {

   Future getData() async {
     http.Response response = await http.get("http://edfloreshz.somee.com/api/alumnos/63");
    debugPrint(response.body);
   }

  @override
  void initState(){
    super.initState();
    getData();
  }

   @override 
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Escuelita"), // Titulo de la barra inicial
         backgroundColor: Colors.lightBlue,
       ),
     );
   }
 }