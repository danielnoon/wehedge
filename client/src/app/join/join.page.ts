import { Component, OnDestroy, OnInit } from '@angular/core';
import { Group } from "../../models/group";
import { Subscription } from "rxjs";
import { ActivatedRoute, Router } from "@angular/router";
import { ApiService } from "../api.service";

@Component({
  selector: 'app-join',
  templateUrl: './join.page.html',
  styleUrls: ['./join.page.scss'],
})
export class JoinPage implements OnInit, OnDestroy {
  id = -1;
  group: Group;
  contribAmount: number;
  private paramSub: Subscription;

  constructor(private route: ActivatedRoute, private api: ApiService, private router: Router) { }

  ngOnInit() {
    this.paramSub = this.route.params.subscribe(params => {
      this.id = parseInt(params.id, 10);
      this.api.getGroupById(this.id).then(g => this.group = g);
    });
  }

  async submitContribution() {
    this.api.addGroupMember(100, this.id, this.contribAmount)
      .then(() => this.router.navigate([`/groups/${this.id}`]));
  }

  ngOnDestroy() {
    this.paramSub.unsubscribe();
  }
}
