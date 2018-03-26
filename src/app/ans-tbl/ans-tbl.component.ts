import { Component, OnInit } from '@angular/core';
import { Ansclass } from '../shared/ansclass';
import { AnsdataService } from '../shared/ansdata.service';

@Component({
  selector: 'app-ans-tbl',
  templateUrl: './ans-tbl.component.html',
  styleUrls: ['./ans-tbl.component.css']
})
export class AnsTblComponent implements OnInit {
public ansarr:Ansclass[]=[];
  constructor(private _dataservice:AnsdataService) { }

  ngOnInit() {
    this._dataservice.getAllAns().subscribe(
      (data:Ansclass[])=>{
        this.ansarr=data;
      },
      function(error)
      {

      },
      function()
      {
        console.log("Ans get");
      }
    );
  }
  deleteans(item:Ansclass)
  {
     this._dataservice.deleteans(item.pk_ans_id).subscribe(
    (data:any)=>{
      this.ansarr.splice(this.ansarr.indexOf(item),1);
    },
    function(error)
    {

    },
    function()
    {
      alert("delete successfully");
    }
    );
  }

}
