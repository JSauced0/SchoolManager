import { AlumnosService } from '../../../services/alumnos/alumnos.service';
import { Component, OnInit, HostBinding } from '@angular/core';
import { Alumno } from 'src/app/models/alumnos';
import { GruposService } from 'src/app/services/grupos/grupos.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-manage-alumnos',
  templateUrl: './manage-alumnos.component.html',
  styleUrls: ['./manage-alumnos.component.css']
})
export class ManageAlumnosComponent implements OnInit {
  @HostBinding('class') classes = 'row';

  alumno: Alumno = {
    id: 0,
    nombre: '',
    expediente: '',
    grupo: 0,
    activo: true,
    grupoNavigation: null
  };
  grupos: any = [];
  edit = false;


  constructor(
    private alumnoService: AlumnosService,
    private gruposService: GruposService,
    private router: Router,
    private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    const params = this.activatedRoute.snapshot.params;

    if (params.id) {
      this.alumnoService.getAlumno(params.id)
        .subscribe(
          res => {
            this.alumno = res['alumnos'][0];
            this.edit = true;
          },
          err => console.error(err)
        );
    }
    this.gruposService.getGrupos().subscribe(
      res => {
        this.grupos = res['grupos'];
      },
      err => console.error(err)
    );
  }

  saveAlumno() {
    this.alumnoService.saveAlumno(this.alumno).subscribe(
      res => {
        console.log(res);
        this.router.navigate(['/alumnos']);
      },
      err => console.error(err)
    );
  }

  putAlumno() {
    this.alumno.grupoNavigation = null;
    this.alumnoService.updateAlumno(this.alumno.id, this.alumno).subscribe(
      res => {
        console.log(this.alumno);
        this.router.navigate(['/alumnos']);
      },
      err => console.error(err)
    );
  }
}