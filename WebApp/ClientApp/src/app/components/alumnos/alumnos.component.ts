import { AlumnosService } from '../../services/alumnos/alumnos.service';
import { Component, OnInit, HostBinding, ApplicationRef } from '@angular/core';
import { GruposService } from 'src/app/services/grupos/grupos.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-alumnos',
  templateUrl: './alumnos.component.html',
  styleUrls: ['./alumnos.component.css']
})
export class AlumnosComponent implements OnInit {
  @HostBinding('class') classes = 'row';
  alumnos: any = []
  constructor(private alumnosService: AlumnosService, appRef: ApplicationRef) { }

  ngOnInit() {
    this.alumnosService.getAlumnos().subscribe(
      res => {
        this.alumnos = res['alumnos'];
      },
      err=>{
        console.error(err)
      }
    );
  }

  desactivarAlumno(id: number){
    this.alumnosService.deactivateAlumno(id).subscribe(
      () => {
        location.reload();
      },
      err => {
        console.log(err);
      }
    );
  }

  activarAlumno(id: number){
    this.alumnosService.activateAlumno(id).subscribe(
      () => {
        location.reload();
      },
      err => {
        console.log(err);
      }
      );
  }
}
