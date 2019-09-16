import { Alumno } from '../../models/alumnos';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'

@Injectable({
  providedIn: 'root'
})
export class AlumnosService {
  apiUrl= 'http://localhost:5000/api';
  constructor(private http: HttpClient) { }
 
  getAlumnos(){
    return this.http.get(`${this.apiUrl}/alumnos`);
  }

  getAlumno(id: number){
    return this.http.get(`${this.apiUrl}/alumnos/${id}`);
  }

  saveAlumno(alumno: Alumno){
    return this.http.post(`${this.apiUrl}/alumnos/`, alumno);
  }

  updateAlumno(id: number, updateAlumno: Alumno){
    return this.http.put(`${this.apiUrl}/alumnos/${id}`, updateAlumno);
  }

  deactivateAlumno(id: number){
    return this.http.post(`${this.apiUrl}/alumnos/deactivate/${id}`, this.getAlumno(id));
  }

  activateAlumno(id: number){
    return this.http.post(`${this.apiUrl}/alumnos/activate/${id}`, this.getAlumno(id));
  }
}
