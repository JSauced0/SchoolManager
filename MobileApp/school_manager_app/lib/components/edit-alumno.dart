import 'package:flutter/material.dart';
import 'package:school_manager_app/components/alumnos.dart';
import 'package:school_manager_app/components/grupos.dart';
import 'package:school_manager_app/components/maestros.dart';
import 'package:school_manager_app/main.dart';

import '../widgets/CustomListTitle.dart';

class EditAlumno extends StatefulWidget {
  List alumnosData;

  EditAlumno(List alumnosData) {
    this.alumnosData = alumnosData;
  }

  @override
  _EditAlumno createState() => _EditAlumno(alumnosData);
}

class _EditAlumno extends State<EditAlumno> {
  List alumnosData;
  Map data;
  String apiURL = 'http://edfloreshz.somee.com/api/alumnos';

  _EditAlumno(List alumnosData) {
    this.alumnosData = alumnosData;
  }

  @override
  void initState() {
    super.initState();
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
              CustomListTitle(Icons.home, "Inicio", () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => MyApp()));
              }),
              CustomListTitle(Icons.person, 'Alumnos', () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Alumnos()));
              }),
              CustomListTitle(Icons.people, 'Maestros', () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Maestros()));
              }),
              CustomListTitle(Icons.school, 'Grupos', () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Grupos()));
              }),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: alumnosData == null ? 0 : alumnosData.length,
            itemBuilder: (BuildContext context, int i) {
              return Card(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "${alumnosData[i]["nombre"]}",
                          style: TextStyle(
                              fontSize: 11.0, fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ));
            }));
  }
}
