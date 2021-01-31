import { Component, OnInit } from '@angular/core';
import { Group } from "../../models/group";
import { ApiService } from "../api.service";
import { NavController } from "@ionic/angular";
import { Location } from "@angular/common";
import { Tag } from "../../models/tag";

@Component({
  selector: 'app-groups',
  templateUrl: './groups.page.html',
  styleUrls: ['./groups.page.scss'],
})
export class GroupsPage implements OnInit {
  groups: Group[] = [];
  tags: Tag[] = [];
  rawSearch: string;

  constructor(private api: ApiService) {}

  ngOnInit() {
    this.api.getGroups().then(g => this.groups = g);
    this.api.getAllTags().then(t => this.tags = t);
  }

  search() {
    console.log(this.tags);
    const kws = this.rawSearch.replace(/[^\sA-z0-9#]/g, '').split(/\s+/g);
    const tags = kws
      .filter(kw => kw.startsWith('#'))
      .map(kw => kw.slice(1))
      .map(kw => this.tags.find(t => t.name.toLowerCase() === kw.toLowerCase())?.id)
      .filter(kw => kw !== null && kw !== undefined);
    const query = kws.filter(kw => !kw.startsWith("#")).join(' ');

    this.api.getGroups({ tags, query }).then(g => this.groups = g);
  }
}
