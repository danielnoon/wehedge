import { Component, OnInit } from '@angular/core';
import { Group } from "../../models/group";
import { ApiService } from "../api.service";

@Component({
  selector: 'app-groups',
  templateUrl: './groups.page.html',
  styleUrls: ['./groups.page.scss'],
})
export class GroupsPage implements OnInit {
  groups: Group[] = [];

  constructor(private api: ApiService) {}

  ngOnInit() {
    this.api.getGroups().then(g => this.groups = g);
  }
}
