import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:school_manager_app/components/grupos.dart';
import 'package:school_manager_app/components/maestros.dart';
import 'package:school_manager_app/main.dart';

import '../widgets/CustomListTitle.dart';

class Alumnos extends StatefulWidget {
  @override
  _Alumnos createState() => _Alumnos();
}

class _Alumnos extends State<Alumnos> {
  List alumnosData;
  Map data;
  String apiURL = 'http://edfloreshz.somee.com/api/alumnos';

  getAlumnos() async {
    http.Response res = await http.get(apiURL);
    data = json.decode(res.body);
    setState(() {
      alumnosData = data['alumnos'];
    });
  }

  @override
  void initState() {
    super.initState();
    getAlumnos();
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
                    Expanded(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: ButtonBar(
                            children: <Widget>[
                              ButtonTheme(
                                minWidth: 20.0,
                                height: 30.0,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => EditAlumno()));
                                  },
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                ),
                              ),
                              ButtonTheme(
                                minWidth: 20.0,
                                height: 30.0,
                                child: RaisedButton(
                                  onPressed: () => [],
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ));
            }));
  }
}

class EditAlumno extends StatefulWidget {
  @override
  _Alumnos createState() => _Alumnos();
}

class _EditAlumno extends State<EditAlumno> {
  List alumnosData;
  Map data;
  String apiURL = 'http://edfloreshz.somee.com/api/alumnos';

  getAlumno(int id) async {
    http.Response res = await http.get("$apiURL/$id");
    data = json.decode(res.body);
    setState(() {
      alumnosData = data['alumnos'];
    });
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
