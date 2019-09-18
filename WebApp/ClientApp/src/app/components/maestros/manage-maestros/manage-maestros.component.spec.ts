import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageMaestrosComponent } from './manage-maestros.component';

describe('ManageMaestrosComponent', () => {
  let component: ManageMaestrosComponent;
  let fixture: ComponentFixture<ManageMaestrosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManageMaestrosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManageMaestrosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
