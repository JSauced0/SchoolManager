import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Grupo } from '../../models/grupos';

@Injectable({
  providedIn: 'root'
})
export class GruposService {

  apiUrl= 'http://edfloreshz.somee.com/api';
  constructor(private http: HttpClient) { }
 
  getGrupos(){
    return this.http.get(`${this.apiUrl}/grupos`);
  }

  getGrupo(id: number){
    return this.http.get(`${this.apiUrl}/grupos/${id}`);
  }

  saveGrupo(grupo: Grupo){
    return this.http.post(`${this.apiUrl}/grupos/`, grupo);
  }

  updateGrupo(id, updateGrupo){
    return this.http.put(`${this.apiUrl}/grupos/${id}`, updateGrupo);
  }

  deactivateGrupo(id: number){
    return this.http.post(`${this.apiUrl}/grupos/deactivate/${id}`, this.getGrupo(id));
  }

  activateGrupo(id: number){
    return this.http.post(`${this.apiUrl}/grupos/activate/${id}`, this.getGrupo(id));
  }
}
