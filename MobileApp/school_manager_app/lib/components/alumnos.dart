import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/CustomListTitle.dart';
import 'grupos.dart';
import 'maestros.dart';
import '../services/alumnos.service.dart';

class Alumnos extends StatefulWidget {
  @override
  _Alumnos createState() => _Alumnos(AlumnosService());
}

class _Alumnos extends State<Alumnos> {
  
  AlumnosService _alumnosService;
  Map data;
  List usersData;

  _Alumnos(AlumnosService alumnosService){
    _alumnosService = alumnosService;
  }

  @override
  void initState(){
    super.initState();
    data = _alumnosService.getUsers();
    usersData = data[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumnos'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.orange, Colors.orangeAccent])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset('lib/img/school.png',
                              width: 80, height: 80),
                        )),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Escuela',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
            CustomListTitle(Icons.home, "Inicio", (){
              Navigator.push(context, new MaterialPageRoute(
                builder: (context) => MyApp() 
              ));
            }),
            CustomListTitle(Icons.person, 'Alumnos', (){
              Navigator.push(context, new MaterialPageRoute(
                builder: (context) => Alumnos() 
              ));
            }),
            CustomListTitle(Icons.people, 'Maestros', (){
              Navigator.push(context, new MaterialPageRoute(
                builder: (context) => Maestros() 
              ));
            }),
            CustomListTitle(Icons.school, 'Grupos', (){
              Navigator.push(context, new MaterialPageRoute(
                builder: (context) => Grupos() 
              ));
            }),
          ],
        ),
      ),
      
      body: ListView.builder(
        itemCount: usersData == null ? 0 : usersData.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Row(
              children: <Widget>[
                Text("${usersData[index]["nombre"]}")
              ],
            ),
          );
        }
      )
    );
  }
}
