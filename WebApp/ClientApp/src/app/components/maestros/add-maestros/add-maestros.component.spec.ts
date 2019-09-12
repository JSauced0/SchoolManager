import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AddMaestrosComponent } from './add-maestros.component';

describe('AddMaestrosComponent', () => {
  let component: AddMaestrosComponent;
  let fixture: ComponentFixture<AddMaestrosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AddMaestrosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AddMaestrosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
