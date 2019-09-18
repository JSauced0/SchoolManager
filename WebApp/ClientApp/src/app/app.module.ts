import { ManageAlumnosComponent } from './components/alumnos/manage-alumnos/manage-alumnos.component';
import { AlumnosService } from './services/alumnos/alumnos.service';
import { GruposComponent } from './components/grupos/grupos.component';
import { MaestrosComponent } from './components/maestros/maestros.component';
import { AlumnosComponent } from './components/alumnos/alumnos.component';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './components/nav-menu/nav-menu.component';
import { HomeComponent } from './components/home/home.component';
import { CounterComponent } from './components/counter/counter.component';
import { ManageMaestrosComponent } from './components/maestros/manage-maestros/manage-maestros.component';
import { MaestrosService } from './services/maestros/maestros.service';
import { GruposService } from './services/grupos/grupos.service';
import { AsignacionComponent } from './components/asignacion/asignacion.component';
import { MateriasComponent } from './components/materias/materias.component';


@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    CounterComponent,
    ManageAlumnosComponent,
    ManageMaestrosComponent,
    AlumnosComponent,
    AsignacionComponent,
    GruposComponent,
    MaestrosComponent,
    MateriasComponent,
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    
    RouterModule.forRoot([
      { path: '', component: HomeComponent, pathMatch: 'full' },
      {path: 'alumnos', component: AlumnosComponent},
      {path: 'maestros', component: MaestrosComponent},
      {path: 'grupos', component: GruposComponent},
      {path: 'alumnos/add', component: ManageAlumnosComponent},
      {path: 'alumnos/edit/:id', component: ManageAlumnosComponent},
      {path: 'maestros/add', component: ManageMaestrosComponent},
      {path: 'maestros/edit/:id', component: ManageMaestrosComponent},
    ])
  ],
  providers: [AlumnosService, MaestrosService, GruposService],
  bootstrap: [AppComponent]
})
export class AppModule { }
