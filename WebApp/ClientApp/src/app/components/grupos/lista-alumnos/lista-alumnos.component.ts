import { ActivatedRoute } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { AlumnosService } from 'src/app/services/alumnos/alumnos.service';
import { GruposService } from 'src/app/services/grupos/grupos.service';

@Component({
  selector: 'app-lista-alumnos',
  templateUrl: './lista-alumnos.component.html',
  styleUrls: ['./lista-alumnos.component.css']
})
export class ListaAlumnosComponent implements OnInit {
  
  constructor(
    private alumnosService: AlumnosService, 
    private gruposService: GruposService,
    private activatedRoute: ActivatedRoute
    ) { }
  
  alumnos: any[]
  grupo: any
  id: any

  ngOnInit() {
    this.id = this.activatedRoute.snapshot.params.id;
    console.log(this.id);
    this.alumnosService.getAlumnos().subscribe(
      res => {
        this.alumnos = res['alumnos'];
      },
      err=>{
        console.error(err)
      }
    );
    this.gruposService.getGrupo(this.id).subscribe(
      res => {
        this.grupo = res['grupos'];
      },
      err=>{
        console.error(err)
      }
    );
  }
}
