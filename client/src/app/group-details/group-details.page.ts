import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from "@angular/router";
import { Subscription } from "rxjs";
import { Group } from "../../models/group";
import { ApiService } from "../api.service";
import { Location } from "@angular/common";
import { NavController } from "@ionic/angular";

@Component({
  selector: 'app-group-details',
  templateUrl: './group-details.page.html',
  styleUrls: ['./group-details.page.scss'],
})
export class GroupDetailsPage implements OnInit, OnDestroy {
  id = -1;
  group: Group;
  member = false;
  private paramSub: Subscription;
  private fragmentSub: Subscription;

  constructor(
    private route: ActivatedRoute,
    private api: ApiService,
    private location: Location,
    private nav: NavController
  ) {}

  ngOnInit() {
    this.paramSub = this.route.params.subscribe(params => {
      this.id = parseInt(params.id, 10);
      this.api
        .getGroupById(this.id)
        .then(g => this.group = g)
        .then(g => )
    });
  }

  goBack() {
    this.nav.setDirection("back", true, "back");
    this.location.back();
  }

  ngOnDestroy() {
    this.paramSub.unsubscribe();
    this.fragmentSub.unsubscribe();
  }
}
