import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { Subscription } from "rxjs";
import { Group } from "../../models/group";

@Component({
  selector: 'app-group-details',
  templateUrl: './group-details.page.html',
  styleUrls: ['./group-details.page.scss'],
})
export class GroupDetailsPage implements OnInit, OnDestroy {
  id = -1;
  group: Group;
  private paramSub: Subscription;

  constructor(private route: ActivatedRoute) { }

  ngOnInit() {
    this.paramSub = this.route.params.subscribe(params => {
      this.id = parseInt(params.id, 10);

      // setTimeout(() => {
      //   this.group = {
      //     id: 0,
      //     name: "WallStreetBets",
      //     tags: ["YOLO", "FUCK ME"],
      //     description: "yoooooooo diamond hands 💎👐 diamond hands hold hold hold woooooo"
      //   };
      // }, 3000);
    });
  }

  ngOnDestroy() {
    this.paramSub.unsubscribe();
  }
}
