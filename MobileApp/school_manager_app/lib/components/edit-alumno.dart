import 'package:flutter/material.dart';

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
  final _editAlumno = GlobalKey<FormState>();
  var value;
  _EditAlumno(List alumnosData) {
    this.alumnosData = alumnosData;
    this.value = alumnosData;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        initialValue: "${alumnosData[i]["grupoNavigation"]["nombre"]}",
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
}
