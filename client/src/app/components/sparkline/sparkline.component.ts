import { AfterViewInit, Component, ElementRef, Input, OnInit, ViewChild } from '@angular/core';
import sparkline from "@fnando/sparkline";

@Component({
  selector: 'app-sparkline',
  templateUrl: './sparkline.component.html',
  styleUrls: ['./sparkline.component.scss'],
})
export class SparklineComponent implements AfterViewInit {
  @Input() width: number;
  @Input() height: number;
  @Input() stroke: number;

  @ViewChild("svg") svg: ElementRef;

  constructor() { }

  ngAfterViewInit() {
    sparkline(this.svg.nativeElement as SVGSVGElement, (new Array(15)).fill(0).map(() => Math.floor(Math.random() * 10)));
  }
}
