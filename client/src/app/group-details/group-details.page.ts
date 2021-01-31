import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { Subscription } from "rxjs";
import { Group } from "../../models/group";
import { ApiService } from "../api.service";

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

  constructor(private route: ActivatedRoute, private api: ApiService) { }

  ngOnInit() {
    this.paramSub = this.route.params.subscribe(params => {
      this.id = parseInt(params.id, 10);
      this.api.getGroupById(this.id).then(g => this.group = g);
    });
  }

  ngOnDestroy() {
    this.paramSub.unsubscribe();
  }
}
