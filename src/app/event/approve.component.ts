import { Component, OnInit } from '@angular/core';
import { Eventclass } from '../shared/eventclass';
import { EventdataService } from '../shared/eventdata.service';
@Component({
  selector: 'app-approve',
  templateUrl: './approve.component.html',
  styleUrls: ['./approve.component.css']
})
export class ApproveComponent implements OnInit {

  constructor(private _Dataservice:EventdataService) { }

  ngOnInit() {
  }

}
