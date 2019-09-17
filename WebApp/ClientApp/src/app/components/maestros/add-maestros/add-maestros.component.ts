import { MaestrosService } from '../../../services/maestros/maestros.service';
import { Component, OnInit, HostBinding } from '@angular/core';
import { Maestro } from 'src/app/models/maestros';
import { GruposService } from 'src/app/services/grupos/grupos.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-add-maestros',
  templateUrl: './add-maestros.component.html',
  styleUrls: ['./add-maestros.component.css']
})
export class AddMaestrosComponent implements OnInit {
@HostBinding('class') classes = 'row';

  maestro: Maestro = {
    expediente: "",
    nombre: "",
    apellido: "",
    direccion: "",
    numero: "",
    activo: true
  };
  grupos: any = []

  constructor(private maestroService: MaestrosService,  private gruposService: GruposService, private router: Router ) { }

  ngOnInit() {
    this.gruposService.getGrupos().subscribe(
      res => {
        console.log(res);
        this.grupos = res['grupos'];
      },
      err=>console.error(err)
    );
  }
  
  saveMaestro(){
    this.maestroService.saveMaestro(this.maestro).subscribe(
      res=>{
        console.log(res);
        this.router.navigate(['/maestros']);
      },
      err => console.error(err)
    );
  }
}
