import 'package:http/http.dart' as http; // Para manejar Peticiones HTTP
import 'dart:async';
import 'dart:convert'; // to conver http response into a JSON.
import 'dart:core';
import 'main.dart';

// DATOS QUE SE USARAN EN UNA CLASE EXTERNA PARA PARSEAR UN JSON ARRAY

class obtenerAlumno {
  static const String url = "http://edfloreshz.somee.com/api/alumnos";
  
  static Future<List<Alumno>> getAlumno() async {
    try {
       final response = await http.get(url);
         List<Alumno> mandarAlumnos(String responseBody) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        return parsed.map<Alumno>((json) => Alumno.fromJson(json)).toList();
      }
      if (response.statusCode == 200) {
        List<Alumno> list = mandarAlumnos(response.body);
        return list;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
   
  }
}
/*
  Future getData() async {
      http.Response response = await http.get("http://edfloreshz.somee.com/api/alumnos");
     a = response;
     debugPrint(mandarAlumnos.toString());
  
  }
*/

