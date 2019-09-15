import { Alumno } from '../../models/alumnos';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'

@Injectable({
  providedIn: 'root'
})
export class AlumnosService {
  apiUrl= 'http://edfloreshz.somee.com/api';
  constructor(private http: HttpClient) { }
 
  getAlumnos(){
    return this.http.get(`${this.apiUrl}/alumnos`);
  }

  getAlumno(id: string){
    return this.http.get(`${this.apiUrl}/alumnos/${id}`);
  }

  saveAlumno(alumno: Alumno){
    return this.http.post(`${this.apiUrl}/alumnos/`, alumno);
  }

  updateAlumno(id: number, updateAlumno: Alumno){
    return this.http.put(`${this.apiUrl}/alumnos/${id}`, updateAlumno);
  }
}
