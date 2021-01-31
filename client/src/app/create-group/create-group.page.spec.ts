import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { CreateGroupPage } from './create-group.page';

describe('CreateGroupPage', () => {
  let component: CreateGroupPage;
  let fixture: ComponentFixture<CreateGroupPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CreateGroupPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(CreateGroupPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
