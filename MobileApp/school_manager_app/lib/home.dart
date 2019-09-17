import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async';
//Pantallas
import 'grupos.dart';
import 'alumnos.dart';
import 'maestros.dart';
import 'dart:convert'; // to conver http response into a JSON.
import 'dart:core';
import 'main.dart';

// Homepage Class que manda a llamar a _Home Page State
class HomeStuck extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// Aqui es donde la accion ocurre
class _HomeState extends State<HomeStuck> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    GruposList(),
    AlumnosList(),
    MaestrosList(),
  ];
  @override
  Widget build(BuildContext context) {
    
    return (
     Scaffold(
    body: _children[_currentIndex],  //Display del navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Index del navigation Bar
        onTap: onTabTapped,
        fixedColor: Color.fromARGB(15, 15, 15,65),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text("Grupos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("Alumnos"),
          ),BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text("Mestros"),
          ),
        ],
      ),
    )
    );
    
  }

  void onTabTapped(int index){
    setState(() {
     _currentIndex = index; 
    });
  }
}
/*
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
  }*/