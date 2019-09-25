import { GradosService } from './../../../services/grados/grados.service';
import { MaestrosService } from 'src/app/services/maestros/maestros.service';
import { GruposService } from 'src/app/services/grupos/grupos.service';
import { Component, OnInit, HostBinding } from '@angular/core';
import { Grupo } from 'src/app/models/grupos';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-manage-grupos',
  templateUrl: './manage-grupos.component.html',
  styleUrls: ['./manage-grupos.component.css']
})
export class ManageGruposComponent implements OnInit {
@HostBinding('class') classes = 'row';
grupo: Grupo = {
  id: 0,
  nombre:'',
  grado:0,
  maestro: null,
  activo: true,
  gradoNavigation: null
};

maestros: any[]
grados: any[]
edit: boolean = false
  constructor(
    private gruposService: GruposService,
    private maestrosService: MaestrosService,
    private gradosService: GradosService,
    private router: Router,
    private activatedRoute: ActivatedRoute
  ) { }

  ngOnInit() {
    const params = this.activatedRoute.snapshot.params;

    if(params.id){
      this.gruposService.getGrupo(params.id)
      .subscribe(
        res =>{
          this.grupo = res['grupos'][0];
          this.edit = true
        },
        err => console.error(err)
      )
    }

    this.gradosService.getGrados().subscribe(
      res=>{
        this.grados = res['grados'];
      },
      err=>console.error(err)
    );

    this.maestrosService.getMaestros().subscribe(
      res=>{
        this.maestros = res['maestros'];
      },
      err=>console.error(err)
    );
  }

  saveGrupo(){
    this.gruposService.saveGrupo(this.grupo).subscribe(
      res =>{
        console.log(res);
        this.router.navigate(['/grupos']);
      },
      err =>console.error(err)
    );
  }

  putGrupo(){
    this.gruposService.updateGrupo(this.grupo.id, this.grupo).subscribe(
      res=>{
        console.log(this.grupo);
        this.router.navigate(['/grupos']);
      },
      err => console.error(err)
    );
  }

}
