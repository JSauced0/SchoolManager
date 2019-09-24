import 'package:flutter/material.dart';
import 'grupos.dart';
import 'alumnos.dart';
import 'maestros.dart';
import 'dart:core';

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
        fixedColor: Color.fromARGB(150, 100, 170,65),
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
