import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async'; // ASYNC AWAIT DART
import 'dart:convert'; // to conver http response into a JSON.
import 'dart:core'; // SOMETHING
//import 'alumnos.dart'; // Alumnos del APi
import 'package:json_annotation/json_annotation.dart';

// part 'Alumno.g.dart';  // IDK BUT I HOPE THIS WILL WORK
// Metodo Principal que manda a llamar a Stateful Widget
void main() {
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
  
   int _selectedIndex = 0;

  void _onItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Map data;
  List userData;
  Future getData() async {
    http.Response response =
        await http.get("http://edfloreshz.somee.com/api/alumnos");
    data = json.decode(response.body);
    setState(() {
     userData = data["alumnos"]; 
    });
    debugPrint(userData.toString());
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
          title: Text("Escuelita"), // Titulo de la barra inicial
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
                  child: Text("id "+"${userData[index]["id"]}"+"\n"+"Nombre: "+" ${userData[index]["nombre"]}"+"\n"+"Grupo: "+"${userData[index]["grupo"]}")
                ),          
              ],
            ),
          );
        }),
        
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.developer_mode),
            title: Text('Mestros'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Alumnos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Materias'),
          ),
        ],
        onTap: (index){
            _incrementTab(index);
        }
      ),body: [
        Alumnos(),
        Maestros(),
        Materias(),
      ].elementAt(_selectedIndex),

        );
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
