import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Cityclass } from '../shared/cityclass';
import { CitydataService } from '../shared/citydata.service';

@Component({
  selector: 'app-city-tbl',
  templateUrl: './city-tbl.component.html',
  styleUrls: ['./city-tbl.component.css']
})
export class CityTblComponent implements OnInit {
public cityarr:Cityclass[]=[];
  constructor(private _citydataservice:CitydataService,private _router:Router) { }

  ngOnInit() {
    this._citydataservice.getAllCity().subscribe(
      (data:Cityclass[])=>{
          this.cityarr=data;
      },
      function(error)
      {

      },
      function()
      {
        console.log("successfully get");
      }
    );
  }
  addcity()
  {
    this._router.navigate(['/addcity']);
  }
  editcity(item:Cityclass)
  {
    this._router.navigate(['/editcity',item.pk_city_id]);
  }
  deletecity(item:Cityclass){
    this._citydataservice.deletecity(item.pk_city_id).subscribe(
    (data:any)=>{
      this.cityarr.splice(this.cityarr.indexOf(item),1);
    },
    function(error)
    {

    },
    function()
    {
      console.log("delete successfully");
    }
    );
  }

}
