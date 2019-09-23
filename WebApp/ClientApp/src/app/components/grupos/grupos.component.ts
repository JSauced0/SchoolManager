import { Component, OnInit } from '@angular/core';
import { GruposService } from 'src/app/services/grupos/grupos.service';

@Component({
  selector: 'app-grupos',
  templateUrl: './grupos.component.html',
  styleUrls: ['./grupos.component.css']
})
export class GruposComponent implements OnInit {

  grupos: any[]

  constructor(private gruposService: GruposService) { }

  ngOnInit() {
    this.gruposService.getGrupos().subscribe(
      res => {
        this.grupos = res['grupos'];
      },
      err => console.error(err)
    );
  }

  desactivarGrupo(id: number){
    this.gruposService.deactivateGrupo(id).subscribe(
      () => {
        location.reload();
      },
      err => {
        console.log(err);
      }
    );
  }

  activarGrupo(id: number){
    this.gruposService.activateGrupo(id).subscribe(
      () => {
        location.reload();
      },
      err => {
        console.log(err);
      }
      );
  }

}
