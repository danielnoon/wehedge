import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { Group } from "../../../models/group";

@Component({
  selector: 'app-group',
  templateUrl: './group.component.html',
  styleUrls: ['./group.component.scss'],
})
export class GroupComponent implements OnInit {
  @Input() group: Group;
  @Output() detailClick = new EventEmitter<void>();

  constructor() {}

  ngOnInit() {}

}
