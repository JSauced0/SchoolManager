import { Component, OnInit, HostBinding} from '@angular/core';
import { MaestrosService } from 'src/app/services/maestros/maestros.service';

@Component({
  selector: 'app-maestros',
  templateUrl: './maestros.component.html',
  styleUrls: ['./maestros.component.css']
})
export class MaestrosComponent implements OnInit {
  @HostBinding('class') classes = 'row';
  maestros: any = []

  constructor(private maestrosService: MaestrosService) { }

  ngOnInit() {
    this.maestrosService.getMaestros().subscribe(
      res => {
        this.maestros = res;
      },
      err=>{
        console.error(err)
      }
    );
  }
}
