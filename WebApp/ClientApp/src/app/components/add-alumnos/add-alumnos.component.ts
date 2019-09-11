import { AlumnosService } from './../../services/alumnos.service';
import { Component, OnInit, HostBinding } from '@angular/core';
import { Alumno } from 'src/app/models/alumnos';

@Component({
  selector: 'app-add-alumnos',
  templateUrl: './add-alumnos.component.html',
  styleUrls: ['./add-alumnos.component.css']
})
export class AddAlumnosComponent implements OnInit {
@HostBinding('class') classes = 'row';

  alumno:Alumno ={
    Nombre: '',
    Expediente: '',
    Grupo: 0,
    Activo: true
  };
  constructor(private alumnoService: AlumnosService ) { }

  ngOnInit() {
  }
  saveAlumno(){
    this.alumnoService.saveAlumno(this.alumno).subscribe(
      res=>{
        console.log(res);
      },
      err => console.error(err)
    );
  }
}
