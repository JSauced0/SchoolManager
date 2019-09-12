import { AlumnosService } from '../../../services/alumnos/alumnos.service';
import { Component, OnInit, HostBinding } from '@angular/core';
import { Alumno } from 'src/app/models/alumnos';
import { GruposService } from 'src/app/services/grupos/grupos.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-add-alumnos',
  templateUrl: './add-alumnos.component.html',
  styleUrls: ['./add-alumnos.component.css']
})
export class AddAlumnosComponent implements OnInit {
@HostBinding('class') classes = 'row';

  alumno: Alumno = {
    nombre: '',
    expediente: '',
    grupo: 0,
    activo: true
  };
  grupos: any = []

  constructor(private alumnoService: AlumnosService,  private gruposService: GruposService, private router: Router ) { }

  ngOnInit() {
    this.gruposService.getGrupos().subscribe(
      res => {
        console.log(res);
        this.grupos = res;
      },
      err=>console.error(err)
    );
  }
  
  saveAlumno(){
    this.alumnoService.saveAlumno(this.alumno).subscribe(
      res=>{
        console.log(res);
        this.router.navigate(['/alumnos']);
      },
      err => console.error(err)
    );
  }
}
