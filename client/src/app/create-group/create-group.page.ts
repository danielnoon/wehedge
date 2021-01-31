import { Component, OnInit } from '@angular/core';
import { Tag } from "../../models/tag";
import { ApiService } from "../api.service";
import { NavController } from "@ionic/angular";
import { Location } from "@angular/common";
import { Router } from "@angular/router";

@Component({
  selector: 'app-create-group',
  templateUrl: './create-group.page.html',
  styleUrls: ['./create-group.page.scss'],
})
export class CreateGroupPage implements OnInit {
  name: string;
  tags: number[];
  description: string;
  priv: boolean;

  allTags: Tag[] = [];

  constructor(
    private api: ApiService,
    private nav: NavController,
    private location: Location,
    private router: Router
  ) {}

  ngOnInit() {
    this.api.getAllTags().then(t => this.allTags = t);
  }

  async submit() {
    const { name, tags, description, priv} = this;
    const { id } = await this.api.createGroup({
      name, tags, description,
      private: priv
    });
    this.nav.setDirection("back", true, "back");
    this.location.back();
    setTimeout(() => this.router.navigate([`/groups/${id}`]), 500);
  }

  get loading() {
    return this.tags.length === 0;
  }
}
