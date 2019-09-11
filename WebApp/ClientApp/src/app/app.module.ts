import { AlumnosService } from './services/alumnos.service';
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


@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    CounterComponent,
    AlumnosComponent,
    GruposComponent,
    MaestrosComponent
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
      
    ])
  ],
  providers: [AlumnosService],
  bootstrap: [AppComponent]
})
export class AppModule { }
