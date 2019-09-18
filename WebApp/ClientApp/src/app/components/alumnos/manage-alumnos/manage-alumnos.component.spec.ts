import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageAlumnosComponent } from './manage-alumnos.component';

describe('ManageAlumnosComponent', () => {
  let component: ManageAlumnosComponent;
  let fixture: ComponentFixture<ManageAlumnosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManageAlumnosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManageAlumnosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
