import { Component, OnInit } from '@angular/core';
import { EventQueTbl } from '../shared/event-que-tbl';
import { EventQuedataService } from '../shared/event-quedata.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-event-que-tbl',
  templateUrl: './event-que-tbl.component.html',
  styleUrls: ['./event-que-tbl.component.css']
})
export class EventQueTblComponent implements OnInit {
public quearr:EventQueTbl[]=[];
  constructor(private _dataservice:EventQuedataService,private _router:Router) { }

  ngOnInit() {
     this._dataservice.getAllQue().subscribe(
      (data:EventQueTbl[])=>{
        this.quearr=data;
      },
      function(error)
      {

      },
      function()
      {
        console.log("Que get");
      }
    );

  }
  deleteque(item:EventQueTbl)
  {
    this._dataservice.deleteQue(item.pk_que_id).subscribe(
    (data:any)=>{
      this.quearr.splice(this.quearr.indexOf(item),1);
    },
    function(error)
    {

    },
    function()
    {
       
   }
    );
  }
}


