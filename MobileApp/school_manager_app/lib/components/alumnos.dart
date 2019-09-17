import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:school_manager_app/components/edit-alumno.dart';
import 'package:school_manager_app/components/grupos.dart';
import 'package:school_manager_app/components/maestros.dart';
import 'package:school_manager_app/main.dart';

import '../widgets/CustomListTitle.dart';

class Alumnos extends StatefulWidget {
  @override
  _Alumnos createState() => _Alumnos();
}

class _Alumnos extends State<Alumnos> {
  List alumnosData, alumnosEdit;
  Map data;
  String apiURL = 'http://edfloreshz.somee.com/api/alumnos';

  getAlumnos() async {
    http.Response res = await http.get(apiURL);
    print(res.body);
    data = json.decode(res.body);
    setState(() {
      alumnosData = data['alumnos'];
    });
  }

  getAlumno(int id) async {
    http.Response res = await http.get("$apiURL/$id");
    data = json.decode(res.body);
    print(res.body);
    setState(() {
      alumnosEdit = data['alumnos'];
    });
  }

  deactivateAlumno(int id) async {
    http.Response res = await http.post("$apiURL/deactivate/$id");
    setState(() {});
  }

  activateAlumno(int id) async {
    http.Response res = await http.post("$apiURL/activate/$id");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAlumnos();
  }

  Widget buildAlumnoDescription(int i) {
    if (alumnosData[i]["activo"]) {
      return Text(
        " ${alumnosData[i]["nombre"]} \n ${alumnosData[i]["expediente"]} \n ${alumnosData[i]["grupoNavigation"]["nombre"]} \n Activo",
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
      );
    }
    return Text(
      " ${alumnosData[i]["nombre"]} \n ${alumnosData[i]["expediente"]} \n ${alumnosData[i]["grupoNavigation"]["nombre"]} \n Inactivo",
      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
    );
  }

  Widget buildStateButton(int i) {
    if (alumnosData[i]["activo"]) {
      return RaisedButton(
        onPressed: () {
          Navigator.push(
            context, new MaterialPageRoute(builder: (context) => Alumnos()));
          deactivateAlumno(alumnosData[i]["id"]);
        },
        color: Colors.orange,
        child: Text(
          "Desactivar",
          style: TextStyle(fontSize: 13.0),
        ),
      );
    }
    return RaisedButton(
      onPressed: () {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => Alumnos()));
        activateAlumno(alumnosData[i]["id"]);
      },
      color: Colors.green,
      child: Text(
        "Activar",
        style: TextStyle(fontSize: 13.0),
      ),
    );
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
                        child: buildAlumnoDescription(i)),
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
                                    getAlumno(alumnosData[i]["id"]);
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                EditAlumno(alumnosEdit)));
                                  },
                                  color: Colors.blue,
                                  child: Text(
                                    "Editar",
                                    style: TextStyle(
                                        fontSize: 13.0, color: Colors.white),
                                  ),
                                ),
                              ),
                              ButtonTheme(
                                  minWidth: 20.0,
                                  height: 30.0,
                                  child: buildStateButton(i)),
                            ],
                          )),
                    )
                  ],
                ),
              ));
            }));
  }
}
