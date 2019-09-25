import { Grados } from './../../models/grados';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'

@Injectable({
  providedIn: 'root'
})
export class GradosService {

  apiUrl= 'http://edfloreshz.somee.com/api';
  constructor(private http: HttpClient) { }
 
  getGrados(){
    return this.http.get(`${this.apiUrl}/grados`);
  }

  getGrado(id: number){
    return this.http.get(`${this.apiUrl}/grados/${id}`);
  }

  saveGrado(grado: Grados){
    return this.http.post(`${this.apiUrl}/grados/`, grado);
  }

  updateGrado(id, updateGrado){
    return this.http.put(`${this.apiUrl}/grados/${id}`, updateGrado);
  }

  deactivateGrado(id: number){
    return this.http.post(`${this.apiUrl}/grados/deactivate/${id}`, this.getGrado(id));
  }

  activateGrado(id: number){
    return this.http.post(`${this.apiUrl}/grados/activate/${id}`, this.getGrado(id));
  }
}
