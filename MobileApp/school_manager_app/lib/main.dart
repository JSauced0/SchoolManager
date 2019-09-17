import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async'; // ASYNC AWAIT DART
import 'dart:convert'; // to conver http response into a JSON.
import 'dart:core'; // SOMETHING
//import 'alumnos.dart'; // Alumnos del APi
import 'home.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'Alumno.g.dart';  // IDK BUT I HOPE THIS WILL WORK
// Metodo Principal que manda a llamar a Stateful Widget
void main() => runApp(HomePage());

// Homepage Class que manda a llamar a _Home Page State
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// Aqui es donde la accion ocurre
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Escuela",
    home: HomeStuck()); 
  }
}
/*

@JsonSerializable()
class Alumno {
  final int id;
  final String expediente;
  final String nombre;
  final int grupo;
  final bool activo;

  Alumno({this.id, this.expediente, this.nombre, this.grupo, this.activo});

  factory Alumno.fromJson(Map<String, dynamic> json) {
    return Alumno(
        id: json['id'] as int,
        expediente: json['expediente'] as String,
        nombre: json['nombre'] as String,
        grupo: json['grupo'] as int,
        activo: json['activo'] as bool);
  }
}
*/
