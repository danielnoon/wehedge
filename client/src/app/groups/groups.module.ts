import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { GroupsPageRoutingModule } from './groups-routing.module';

import { GroupsPage } from './groups.page';
import { ComponentsModule } from "../components/components.module";

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    GroupsPageRoutingModule,
    ComponentsModule
  ],
  declarations: [GroupsPage]
})
export class GroupsPageModule {}
