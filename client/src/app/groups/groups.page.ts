import { Component, OnInit } from '@angular/core';
import { Group } from "../../models/group";

@Component({
  selector: 'app-groups',
  templateUrl: './groups.page.html',
  styleUrls: ['./groups.page.scss'],
})
export class GroupsPage implements OnInit {
  groups: Group[] = [
    {
      id: 0,
      name: "WallStreetBets",
      tags: ["YOLO", "FUCK ME"],
      description: "yoooooooo diamond hands 💎👐 diamond hands hold hold hold woooooo"
    },
    {
      id: 1,
      name: "Tech",
      tags: ["TECH", "STABLE"],
      description: "We're a group of investors interested in buying shares of technology firms large and small. Join us!"
    }
  ];

  constructor() {}

  ngOnInit() {}
}
