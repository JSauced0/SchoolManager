import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AlumnosService {
  
  String apiURL = 'http://edfloreshz.somee.com/api/alumnos';
 
  getUsers() async {
    http.Response res = await http.get(apiURL);
    return json.decode(res.body);
  }
}