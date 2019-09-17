import { Maestro } from '../../models/maestros';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'

@Injectable({
  providedIn: 'root'
})
export class MaestrosService {
  apiUrl= 'http://edfloreshz.somee.com/api';
  constructor(private http: HttpClient) { }
 
  getMaestros(){
    return this.http.get(`${this.apiUrl}/maestros`);
  }

  getMaestro(id: string){
    return this.http.get(`${this.apiUrl}/maestros/${id}`);
  }

  saveMaestro(maestro: Maestro){
    return this.http.post(`${this.apiUrl}/maestros/`, maestro);
  }

  updateMaestro(id, updateMaestro){
    return this.http.put(`${this.apiUrl}/maestros/${id}`, updateMaestro);
  }
}