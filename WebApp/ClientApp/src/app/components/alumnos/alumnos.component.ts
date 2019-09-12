import { AlumnosService } from '../../services/alumnos/alumnos.service';
import { Component, OnInit, HostBinding } from '@angular/core';
import { GruposService } from 'src/app/services/grupos/grupos.service';

@Component({
  selector: 'app-alumnos',
  templateUrl: './alumnos.component.html',
  styleUrls: ['./alumnos.component.css']
})
export class AlumnosComponent implements OnInit {
  @HostBinding('class') classes = 'row';
  alumnos: any = []
  constructor(private alumnosService: AlumnosService) { }

  ngOnInit() {
    this.alumnosService.getAlumnos().subscribe(
      res => {
        this.alumnos = res;
      },
      err=>{
        console.error(err)
      }
    );
    
  }

}
