import { Component, OnInit, HostBinding} from '@angular/core';
import { MaestrosService } from 'src/app/services/maestros/maestros.service';

@Component({
  selector: 'app-maestros',
  templateUrl: './maestros.component.html',
  styleUrls: ['./maestros.component.css']
})
export class MaestrosComponent implements OnInit {
  @HostBinding('class') classes = 'row';
  maestros: any = [];

  constructor(private maestrosService: MaestrosService) { }

  ngOnInit() {
    this.maestrosService.getMaestros().subscribe(
      res => {
        this.maestros = res['maestros'];
      },
      err => {
        console.error(err);
      }
    );
  }

  desactivarMaestro(id: number) {
    this.maestrosService.deactivateMaestro(id).subscribe(
      () => {
        location.reload();
      },
      err => {
        console.log(err);
      }
    );
  }

  activarMaestro(id: number) {
    this.maestrosService.activateMaestro(id).subscribe(
      () => {
        location.reload();
      },
      err => {
        console.log(err);
      }
      );
  }
}
