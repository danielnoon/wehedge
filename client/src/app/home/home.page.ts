import { Component, OnInit } from '@angular/core';
import { Group } from "../../models/group";
import { ApiService } from "../api.service";

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit {
  netChange = +1_250.93;
  funds = 2_322.00;
  groups: Group[] = [];

  constructor(private api: ApiService) {}

  ngOnInit() {
    this.api
      .getGroups()
      .then(g => this.groups = g);
  }

  isGain() {
    return this.netChange > 0;
  }
}
