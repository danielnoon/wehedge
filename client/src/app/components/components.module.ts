import { NgModule } from "@angular/core";
import { GroupComponent } from "./group/group.component";
import { HeaderComponent } from "./header/header.component";
import { CommonModule } from "@angular/common";
import { FormsModule } from "@angular/forms";
import { IonicModule } from "@ionic/angular";
import { RouterModule } from "@angular/router";
import { SparklineComponent } from "./sparkline/sparkline.component";

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule
  ],
  declarations: [GroupComponent, HeaderComponent, SparklineComponent],
  exports: [GroupComponent, HeaderComponent, SparklineComponent]
})
export class ComponentsModule {}
