import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class EditAlumno extends StatefulWidget {
  int id;
  EditAlumno(int id) {
    this.id = id;
  }

  @override
  _EditAlumno createState() => _EditAlumno(id);
}

class _EditAlumno extends State<EditAlumno> {
  List alumnosData;
  Map data;
  String apiURL = 'http://edfloreshz.somee.com/api/alumnos';
  int id;
  final _editAlumno = GlobalKey<FormState>();

  _EditAlumno(int id) {
    this.id = id;
  }

  getAlumno(int id) async {
    http.Response res = await http.get("$apiURL/$id");
    data = json.decode(res.body);
    print(res.body);
    setState(() {
      alumnosData = data['alumnos'];
    });
  }

  @override
  void initState() {
    super.initState();
    if (id != null) {
      getAlumno(id);
    }
  }

  Widget buildForm() {
    if (id != null) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Editar Alumno'),
          ),
          body: ListView.builder(
              itemCount: alumnosData == null ? 0 : alumnosData.length,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _editAlumno,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          initialValue: "${alumnosData[i]["nombre"]}",
                        ),
                        TextFormField(
                          initialValue: "${alumnosData[i]["expediente"]}",
                        ),
                        TextFormField(
                          initialValue:
                              "${alumnosData[i]["grupoNavigation"]["nombre"]}",
                        ),
                        TextFormField(
                          initialValue: "${alumnosData[i]["activo"]}",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: RaisedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false
                              // otherwise.
                              if (_editAlumno.currentState.validate()) {
                                // If the form is valid, display a Snackbar.
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            },
                            child: Text('Guardar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
              }));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Añadir Alumno'),
        ),
        body: Card(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _editAlumno,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: TextEditingController(text: "Nombre"),
                ),
                TextFormField(),
                TextFormField(),
                TextFormField(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_editAlumno.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('Guardar'),
                  ),
                ),
              ],
            ),
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return buildForm();
  }
}
