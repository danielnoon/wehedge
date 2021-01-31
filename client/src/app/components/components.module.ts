import { NgModule } from "@angular/core";
import { GroupComponent } from "./group/group.component";
import { HeaderComponent } from "./header/header.component";
import { CommonModule } from "@angular/common";
import { FormsModule } from "@angular/forms";
import { IonicModule } from "@ionic/angular";
import { RouterModule } from "@angular/router";

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule
  ],
  declarations: [GroupComponent, HeaderComponent],
  exports: [GroupComponent, HeaderComponent]
})
export class ComponentsModule {}
