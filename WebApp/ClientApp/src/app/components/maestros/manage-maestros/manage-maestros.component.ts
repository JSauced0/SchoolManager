import { MaestrosService } from '../../../services/maestros/maestros.service';
import { Component, OnInit, HostBinding } from '@angular/core';
import { Maestro } from 'src/app/models/maestros';
import { GruposService } from 'src/app/services/grupos/grupos.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-manage-maestros',
  templateUrl: './manage-maestros.component.html',
  styleUrls: ['./manage-maestros.component.css']
})
export class ManageMaestrosComponent implements OnInit {
  @HostBinding('class') classes = 'row';

  maestro: Maestro = {
    id: 0,
    expediente: '',
    nombre: '',
    apellido: '',
    direccion: '',
    numero: '',
    activo: true
  };
  grupos: any = [];
  edit = false;

  constructor(
    private maestroService: MaestrosService,
    private gruposService: GruposService,
    private router: Router,
    private activatedRoute: ActivatedRoute
  ) { }

  ngOnInit() {
    const params = this.activatedRoute.snapshot.params;

    if (params.id) {
      this.maestroService.getMaestro(params.id).subscribe(
        res => {
          this.maestro = res['maestros'][0];
          this.edit = true;
        },
        err => console.error(err)
      );
    }
    this.gruposService.getGrupos().subscribe(
      res => {
        console.log(res);
        this.grupos = res['grupos'];
      },
      err => console.error(err)
    );
  }

  saveMaestro() {
    this.maestroService.saveMaestro(this.maestro).subscribe(
      res => {
        console.log(res);
        this.router.navigate(['/maestros']);
      },
      err => console.error(err)
    );
  }

  putMaestro() {
    this.maestroService.updateMaestro(this.maestro.id, this.maestro).subscribe(
      res => {
        console.log(this.maestro);
        this.router.navigate(['/maestros']);
      },
      err => console.error(err)
    );
  }
}
