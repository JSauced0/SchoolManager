import { AlumnosService } from './../../services/alumnos.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-alumnos',
  templateUrl: './alumnos.component.html',
  styleUrls: ['./alumnos.component.css']
})
export class AlumnosComponent implements OnInit {

  constructor(private alumnosService: AlumnosService) { }

  ngOnInit() {
    this.alumnosService.getAlumnos().subscribe(
      res => console.log(res),
      err=>console.error(err)
    );
  }

}
